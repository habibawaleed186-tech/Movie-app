import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_case/search_movies_use_case.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUseCase searchUseCase;

  SearchBloc(this.searchUseCase) : super(SearchInitial()) {
    on<SearchMoviesEvent>(_onSearchMovies);
  }

  Future<void> _onSearchMovies(
    SearchMoviesEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoading());

    try {
      final movies = await searchUseCase(event.query);

      emit(SearchSuccess(movies));
    } catch (error) {
      emit(SearchError(error.toString()));
    }
  }
}
