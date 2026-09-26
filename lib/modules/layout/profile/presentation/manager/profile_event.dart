part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class GetProfileDataEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class GetFavoritesEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class AddFavoriteEvent extends ProfileEvent {
  final ProfileEntity movie;

  AddFavoriteEvent(this.movie);

  @override
  List<Object?> get props => [movie];
}

class RemoveFavoriteEvent extends ProfileEvent {
  final int movieId;

  const RemoveFavoriteEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class IsFavoriteEvent extends ProfileEvent {
  final int movieId;

  IsFavoriteEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class GetHistoryEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class AddHistoryEvent extends ProfileEvent {
  final ProfileEntity movie;

  const AddHistoryEvent(this.movie);

  @override
  List<Object?> get props => [movie];
}