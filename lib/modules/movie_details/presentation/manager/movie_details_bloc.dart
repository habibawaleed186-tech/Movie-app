import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/modules/Home_screen/update_view/presentation/manager/update_profile_bloc.dart';
import 'package:movie_app/modules/layout/home/domain/entity/movie_entity.dart';

import '../../../../core/Network/api_results.dart';
import '../../domain/use_case/movie_details_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(MovieDetailsInitial()) {
    on<GetMovieDetailsEvent>(_onGetMovieDetailsEvent);
  }

  FutureOr<void> _onGetMovieDetailsEvent(
      GetMovieDetailsEvent event,
      Emitter<MovieDetailsState> emit,
      )async{
    emit(MovieDetailsLoading());

    final result = await GetIt.I<MovieDetailsUseCase>().execute(event.movieId);
    switch (result) {

      case SuccessRequest(data: final movie):
        emit(
          MovieDetailsSuccess(movie),
        );

      case FailureRequest(exception: final exception):
        emit(
          MovieDetailsError(
            exception.message ?? "Something went wrong",
          ),
        );
    }
  }
}