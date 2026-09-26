import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/failures/server_faliuer.dart';

import '../../domain/use_cases/get_movies_by_genre_use_case.dart';
import 'browse_state.dart';

class BrowseCubit extends Cubit<BrowseState> {
  static const String defaultGenre = kDefaultBrowseGenre;

  final GetMoviesByGenreUseCase getMoviesByGenreUseCase;

  /// Currently active/selected genre (defaults to [defaultGenre]).
  String selectedGenre;

  BrowseCubit({
    required this.getMoviesByGenreUseCase,
    String? initialGenre,
  })  : selectedGenre = initialGenre ?? defaultGenre,
        super(const BrowseInitial());

  Future<void> fetchMoviesByGenre(String genre) async {
    selectedGenre = genre;
    emit(BrowseLoading(selectedGenre: genre));

    final result = await getMoviesByGenreUseCase.call(genre);

    result.fold(
      (failure) {
        if (isClosed) return;

        final message =
            failure is ServerFailure && failure.message?.isNotEmpty == true
                ? failure.message!
                : 'Something went wrong. Please try again.';

        emit(BrowseError(message: message, selectedGenre: genre));
      },
      (movies) {
        if (isClosed) return;

        emit(BrowseSuccess(movies: movies, selectedGenre: genre));
      },
    );
  }
}