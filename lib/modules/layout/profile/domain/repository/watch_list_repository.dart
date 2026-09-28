import '../../data/model/profile_model.dart';

import '../entities/profile_entity.dart';

abstract class WatchListRepository {

  Future<List<ProfileEntity>> getFavorites();

  Future<void> addFavorite(ProfileEntity movie);

  Future<void> removeFavorite(int movieId);

  Future<bool> isFavorite(int movieId);
}