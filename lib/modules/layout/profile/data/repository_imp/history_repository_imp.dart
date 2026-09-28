 import 'package:movie_app/modules/layout/profile/data/data_source/history_data_source_interface.dart';
import 'package:movie_app/modules/layout/profile/data/model/profile_model.dart';
import 'package:movie_app/modules/layout/profile/domain/entities/profile_entity.dart';
import 'package:movie_app/modules/layout/profile/domain/repository/history_repository.dart';

class HistoryRepositoryImp implements HistoryRepository {
  final HistoryDataSourceInterface _dataSourceInterface;
  HistoryRepositoryImp(this._dataSourceInterface);

  @override
  Future<void> addHistory(ProfileEntity movie) async {
    final model = ProfileModel.fromEntity(movie);
    await _dataSourceInterface.addHistory(model);
  }

  @override
  Future<List<ProfileEntity>> getHistory()async {
   return await _dataSourceInterface.getHistory();
  }

}