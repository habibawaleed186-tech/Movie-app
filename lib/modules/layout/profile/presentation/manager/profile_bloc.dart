
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/modules/layout/profile/domain/use_case/add_history_use_case.dart';
import 'package:movie_app/modules/layout/profile/domain/use_case/get_history_use_case.dart';

import '../../domain/entities/profile_entity.dart';
import '../../domain/use_case/add_favourite_use_case.dart';
import '../../domain/use_case/get_favourite_use_case.dart';
import '../../domain/use_case/remove_favourite_use_case.dart';
import '../../domain/use_case/is_favourite_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetProfileDataEvent>(_onGetProfileDataEvent);

    on<GetFavoritesEvent>(_onGetFavouriteEvent);
    on<AddFavoriteEvent>(_onAddFavoriteEvent);
    on<RemoveFavoriteEvent>(_onRemoveFavoriteEvent);
    on<IsFavoriteEvent>(_onIsFavouriteEvent);

    on<GetHistoryEvent>(_onGetHistoryEvent);
    on<AddHistoryEvent>(_onAddHistoryEvent);
  }


  // Get Profile Data


  FutureOr<void> _onGetProfileDataEvent(
      GetProfileDataEvent event,
      Emitter<ProfileState> emit,
      ) async {
    try {
      final favorites = await GetIt.I<GetFavouriteUseCase>().execute();
      final histories = await GetIt.I<GetHistoryUseCase>().execute();

      emit(
        ProfileLoaded(
          favorites: favorites,
          histories: histories,
        ),
      );
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  // Favorites


  FutureOr<void> _onGetFavouriteEvent(
      GetFavoritesEvent event,
      Emitter<ProfileState> emit,
      ) async {
    try {
      final result = await GetIt.I<GetFavouriteUseCase>().execute();

      final currentState = state is ProfileLoaded
          ? state as ProfileLoaded
          : const ProfileLoaded();

      emit(
        currentState.copyWith(
          favorites: result,
        ),
      );
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
  FutureOr<void> _onAddFavoriteEvent(
      AddFavoriteEvent event,
      Emitter<ProfileState> emit,
      ) async {
    try {
      await GetIt.I<AddFavouriteUseCase>().execute(event.movie);

      final currentState = state is ProfileLoaded
          ? state as ProfileLoaded
          : const ProfileLoaded();

      final updatedFavorites = [
        ...currentState.favorites,
        event.movie,
      ];

      emit(
        currentState.copyWith(
          favorites: updatedFavorites,
          isFavorite: true,
        ),
      );
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  FutureOr<void> _onRemoveFavoriteEvent(
      RemoveFavoriteEvent event,
      Emitter<ProfileState> emit,
      ) async {
    try {
      await GetIt.I<RemoveFavouriteUseCase>().execute(event.movieId);

      final currentState = state is ProfileLoaded
          ? state as ProfileLoaded
          : const ProfileLoaded();

      final updatedFavorites = currentState.favorites
          .where((movie) => movie.id != event.movieId)
          .toList();

      emit(
        currentState.copyWith(
          favorites: updatedFavorites,
          isFavorite: false,
        ),
      );
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  FutureOr<void> _onIsFavouriteEvent(
      IsFavoriteEvent event,
      Emitter<ProfileState> emit,
      ) async {
    try {
      final result =
      await GetIt.I<IsFavouriteUseCase>()
          .execute(event.movieId);

      final currentState = state is ProfileLoaded
          ? state as ProfileLoaded
          : const ProfileLoaded();

      emit(
        currentState.copyWith(
          isFavorite: result,
        ),
      );
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }


  // History


  FutureOr<void> _onGetHistoryEvent(
      GetHistoryEvent event,
      Emitter<ProfileState> emit,
      ) async {
    try {
      final results = await GetIt.I<GetHistoryUseCase>().execute();

      final currentState = state is ProfileLoaded
          ? state as ProfileLoaded
          : const ProfileLoaded();

      emit(
        currentState.copyWith(
          histories: results,
        ),
      );
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  FutureOr<void> _onAddHistoryEvent(
      AddHistoryEvent event,
      Emitter<ProfileState> emit,
      ) async {
    try {
      await GetIt.I<AddHistoryUseCase>().execute(event.movie);

      final history = await GetIt.I<GetHistoryUseCase>().execute();

      final currentState = state is ProfileLoaded
          ? state as ProfileLoaded
          : const ProfileLoaded();

      emit(
        currentState.copyWith(
          histories: history,
        ),
      );
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}