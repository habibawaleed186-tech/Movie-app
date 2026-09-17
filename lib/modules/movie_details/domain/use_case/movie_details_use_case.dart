import 'package:movie_app/core/Network/api_results.dart';
import 'package:movie_app/modules/layout/home/domain/entity/movie_entity.dart';
import 'package:movie_app/modules/movie_details/domain/repository/movie_details_repository.dart';

class MovieDetailsUseCase {

  final MovieDetailsRepository _movieDetailsRepository;
  MovieDetailsUseCase(this._movieDetailsRepository);

  Future<ApiResults<MovieEntity>> execute(int movieId)async{
   return  await _movieDetailsRepository.getMovieDetails(movieId);
  }
}