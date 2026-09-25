import 'package:movie_app/modules/layout/profile/domain/entities/profile_entity.dart';
import 'package:movie_app/modules/layout/profile/domain/repository/history_repository.dart';

class GetHistoryUseCase {
  final HistoryRepository _historyRepository;
  GetHistoryUseCase(this._historyRepository);

  Future<List<ProfileEntity>> execute ()async{
    return await _historyRepository.getHistory();
  }
}