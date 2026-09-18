import 'package:equatable/equatable.dart';

import '../../domain/entities/movie_entity.dart';

/// Genre selected when the browse screen opens for the first time.
const String kDefaultBrowseGenre = 'Action';

abstract class BrowseState extends Equatable {
  const BrowseState();

  @override
  List<Object?> get props => [];
}

class BrowseInitial extends BrowseState {
  const BrowseInitial();
}

class BrowseLoading extends BrowseState {
  final String selectedGenre;

  const BrowseLoading({required this.selectedGenre});

  @override
  List<Object?> get props => [selectedGenre];
}

class BrowseSuccess extends BrowseState {
  final List<MovieEntity> movies;
  final String selectedGenre;

  const BrowseSuccess({required this.movies, required this.selectedGenre});

  @override
  List<Object?> get props => [movies, selectedGenre];
}

class BrowseError extends BrowseState {
  final String message;
  final String selectedGenre;

  const BrowseError({required this.message, required this.selectedGenre});

  @override
  List<Object?> get props => [message, selectedGenre];
}