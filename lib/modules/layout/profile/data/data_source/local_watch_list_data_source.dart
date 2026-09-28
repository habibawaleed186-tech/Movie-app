import 'dart:convert';
import 'package:movie_app/modules/layout/profile/data/data_source/watch_list_data_source_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/profile_model.dart';

class LocalWatchListDataSource implements WatchListDataSourceInterface{
  static const String favoritesKey = 'favorite_movies';

  @override
  Future<bool> isFavorite(int movieId)async {
    final favorites = await getFavorites();

    return favorites.any(
          (movie) => movie.id == movieId,
    );
  }

  @override
  Future<void> addFavorite(ProfileModel movie) async {
    final movieId = movie.id;
    if (movieId == null) return;

    final alreadyExists = await isFavorite(movieId);
    if (alreadyExists) return;

    final favorites = await getFavorites();
    favorites.add(movie);

    final prefs = await SharedPreferences.getInstance();

    final movies = favorites.map((movie) {
      return jsonEncode(movie.toJson());
    }).toList();

    await prefs.setStringList(
      favoritesKey,
      movies,
    );
  }

  @override
  Future<List<ProfileModel>> getFavorites() async{
    final prefs = await SharedPreferences.getInstance();

    final movies = prefs.getStringList(favoritesKey) ?? [];
    return movies.map((movie) {
      return ProfileModel.fromJson(
        jsonDecode(movie),
      );
    }).toList();
  }


  @override
  Future<void> removeFavorite(int movieId) async{
    final favorites = await getFavorites();
    favorites.removeWhere(
          (movie) => movie.id == movieId,
    );

    final prefs = await SharedPreferences.getInstance();
    final movies = favorites.map((movie) {
      return jsonEncode(movie.toJson());
    }).toList();

    await prefs.setStringList(
      favoritesKey,
      movies,
    );
  }

}