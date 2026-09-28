part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();
}

final class ProfileInitial extends ProfileState {
  @override
  List<Object> get props => [];
}

class ProfileLoading extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoaded extends ProfileState {
  final List<ProfileEntity> favorites;
  final List<ProfileEntity> histories;
  final bool isFavorite;

  const ProfileLoaded({
    this.favorites = const [],
    this.histories = const [],
    this.isFavorite = false,
  });

  ProfileLoaded copyWith({
    List<ProfileEntity>? favorites,
    List<ProfileEntity>? histories,
    bool? isFavorite,
  }) {
    return ProfileLoaded(
      favorites: favorites ?? this.favorites,
      histories: histories ?? this.histories,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  List<Object?> get props => [
    favorites,
    histories,
    isFavorite,
  ];
}


class FavoriteChecked extends ProfileState {
  final bool isFavorite;

  FavoriteChecked(this.isFavorite);

  @override
  List<Object?> get props => [isFavorite];
}

class FavoriteAdded extends ProfileState {
  @override
  List<Object?> get props => [];
}

class FavoriteRemoved extends ProfileState {
  @override
  List<Object?> get props => [];
}

class HistoryAdded extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError(this.message);

  @override
  List<Object?> get props => [message];
}