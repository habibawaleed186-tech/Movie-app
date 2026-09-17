part of 'movie_details_bloc.dart';

sealed class MovieDetailsState extends Equatable {
  const MovieDetailsState();
}

final class MovieDetailsInitial extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

final class MovieDetailsLoading extends MovieDetailsState {
  @override
  List<Object> get props => [];
}

final class MovieDetailsSuccess extends MovieDetailsState {
  final MovieEntity movie;
  final List<MovieEntity> similarMovies;

  const MovieDetailsSuccess({
  required this.movie,
  required this.similarMovies,
  });

  @override
  List<Object> get props => [movie, similarMovies];
  }



final class MovieDetailsError extends MovieDetailsState {
  final String message;
  const MovieDetailsError(this.message);
  @override
  List<Object> get props => [message];
}

