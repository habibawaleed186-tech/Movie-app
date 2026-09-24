import '../repository/watch_list_repository.dart';

class RemoveFavouriteUseCase {

  final WatchListRepository _watchListRepository;
  RemoveFavouriteUseCase(this._watchListRepository);

  Future<void> execute(int movieId)async{
    return await _watchListRepository.removeFavorite(movieId);
}
}