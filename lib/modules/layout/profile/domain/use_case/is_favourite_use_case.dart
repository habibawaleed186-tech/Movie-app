import '../repository/watch_list_repository.dart';

class IsFavouriteUseCase {
  final WatchListRepository _watchListRepository;
  IsFavouriteUseCase(this._watchListRepository);

  Future<bool> execute(int movieId)async{
    return await _watchListRepository.isFavorite(movieId);
  }


}