part of 'movie_details_bloc.dart';

sealed class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}

class GetMovieDetailsEvent  extends MovieDetailsEvent{
  final int movieId;
  const GetMovieDetailsEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
class GetMovieSuggestionsEvent extends MovieDetailsEvent {
  final int movieId;
  const GetMovieSuggestionsEvent(this.movieId);

  @override
  // TODO: implement props
  List<Object?> get props => [movieId];
}