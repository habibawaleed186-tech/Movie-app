import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/get_movies_use_case.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetMoviesUseCase getMoviesUseCase;

  HomeCubit(this.getMoviesUseCase) : super(HomeInitial());

  Future<void> fetchMovies() async {
    emit(HomeLoading());

    try {
      final movies = await getMoviesUseCase();
      emit(HomeSuccess(movies));
    } catch (error) {
      final message = error.toString()
          .replaceFirst('Exception: ', '')
          .replaceFirst('FormatException: ', '');
      emit(HomeError(message));
    }
  }
}
