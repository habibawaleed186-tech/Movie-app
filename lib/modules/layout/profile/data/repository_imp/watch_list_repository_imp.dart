import 'package:movie_app/modules/layout/home/data/model/movie_model.dart';
import 'package:movie_app/modules/layout/profile/data/data_source/local_watch_list_data_source.dart';
import 'package:movie_app/modules/layout/profile/data/data_source/watch_list_data_source_interface.dart';
import 'package:movie_app/modules/layout/profile/domain/entities/profile_entity.dart';
import 'package:movie_app/modules/layout/profile/domain/repository/watch_list_repository.dart';

import '../model/profile_model.dart';

class WatchListRepositoryImp implements WatchListRepository{
  final WatchListDataSourceInterface _dataSource;
  WatchListRepositoryImp(this._dataSource);

  @override
  Future<void> addFavorite(ProfileEntity movie) async {
    final model = ProfileModel.fromEntity(movie);

    await _dataSource.addFavorite(model);
  }

  @override
  Future<List<ProfileEntity>> getFavorites() async {
    return await _dataSource.getFavorites();
  }

  @override
  Future<void> removeFavorite(int movieId) async {
    await _dataSource.removeFavorite(movieId);
  }

  @override
  Future<bool> isFavorite(int movieId) async {
    return await _dataSource.isFavorite(movieId);
  }

}