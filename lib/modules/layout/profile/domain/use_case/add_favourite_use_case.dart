import 'package:movie_app/modules/layout/profile/domain/repository/watch_list_repository.dart';

import '../entities/profile_entity.dart';

class AddFavouriteUseCase {
  final WatchListRepository _watchListRepository;
  AddFavouriteUseCase(this._watchListRepository);


  Future<void> execute(ProfileEntity movie)async{
     await _watchListRepository.addFavorite(movie);
  }
}