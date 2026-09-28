import 'package:movie_app/modules/layout/profile/domain/entities/profile_entity.dart';

abstract class HistoryRepository {

  Future<List<ProfileEntity>> getHistory();
  Future<void> addHistory(ProfileEntity movie);
}