import 'package:movie_app/modules/layout/profile/data/model/profile_model.dart';

abstract class HistoryDataSourceInterface {

  Future<List<ProfileModel>> getHistory();
  Future<void> addHistory(ProfileModel movie);
}