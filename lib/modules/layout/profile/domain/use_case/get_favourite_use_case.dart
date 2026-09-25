import '../entities/profile_entity.dart';
import '../repository/watch_list_repository.dart';

class GetFavouriteUseCase {
  final WatchListRepository _watchListRepository;
  GetFavouriteUseCase(this._watchListRepository);

  Future<List<ProfileEntity>> execute()async{
    return await _watchListRepository.getFavorites();
  }




}