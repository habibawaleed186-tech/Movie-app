import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/modules/Home_screen/update_view/presentation/manager/update_profile_bloc.dart';
import 'package:movie_app/modules/layout/home/domain/entity/movie_entity.dart';

import '../../../../core/Network/api_results.dart';
import '../../domain/use_case/movie_details_use_case.dart';
import '../../domain/use_case/movie_similar_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(MovieDetailsInitial()) {
    on<GetMovieDetailsEvent>(_onGetMovieDetailsEvent);
    on<GetMovieSuggestionsEvent>(_onGetMovieSuggestionsEvent);
  }

  FutureOr<void> _onGetMovieDetailsEvent(
      GetMovieDetailsEvent event,
      Emitter<MovieDetailsState> emit,
      ) async {
    emit(MovieDetailsLoading());

    final result = await GetIt.I<MovieDetailsUseCase>().execute(event.movieId);
    switch (result) {
      case SuccessRequest(data: final movie):
        emit(
          MovieDetailsSuccess(
            movie: movie,
            similarMovies: const [],
          ),
        );

      case FailureRequest(exception: final exception):
        emit(
          MovieDetailsError(
            exception.message ?? "Something went wrong",
          ),
        );
    }
  }

  FutureOr<void> _onGetMovieSuggestionsEvent(
      GetMovieSuggestionsEvent event,
      Emitter<MovieDetailsState> emit,
      ) async {
    final result = await GetIt.I<MovieSimilarUseCase>().call(event.movieId);

    switch (result) {
      case SuccessRequest(data: final movies):
        if (state is MovieDetailsSuccess) {
          final currentMovie = (state as MovieDetailsSuccess).movie;
          emit(MovieDetailsSuccess(movie: currentMovie, similarMovies: movies));
        }
        break;

      case FailureRequest(exception: final exception):
        break;
    }
  }
}