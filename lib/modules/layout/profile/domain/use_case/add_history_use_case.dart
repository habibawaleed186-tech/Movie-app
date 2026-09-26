import 'package:movie_app/modules/layout/home/domain/entity/movie_entity.dart';
import 'package:movie_app/modules/layout/profile/domain/repository/history_repository.dart';

import '../entities/profile_entity.dart';

class AddHistoryUseCase {
  final HistoryRepository _historyRepository;
  AddHistoryUseCase(this._historyRepository);


  Future<void> execute (ProfileEntity movie) async{
    await _historyRepository.addHistory(movie);
  }
}