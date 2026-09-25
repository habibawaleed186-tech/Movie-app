import '../../../home/data/model/movie_model.dart';
import '../model/profile_model.dart';

abstract class WatchListDataSourceInterface {

  Future<List<ProfileModel>> getFavorites();

  Future<void> addFavorite(ProfileModel movie);

  Future<void> removeFavorite(int movieId);

  Future<bool> isFavorite(int movieId);
}