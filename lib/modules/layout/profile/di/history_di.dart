import 'package:movie_app/modules/layout/profile/data/data_source/history_data_source_interface.dart';
import 'package:movie_app/modules/layout/profile/data/data_source/local_history_data_source.dart';
import 'package:movie_app/modules/layout/profile/data/repository_imp/history_repository_imp.dart';
import 'package:movie_app/modules/layout/profile/domain/repository/history_repository.dart';
import 'package:movie_app/modules/layout/profile/domain/use_case/add_history_use_case.dart';
import 'package:movie_app/modules/layout/profile/domain/use_case/get_history_use_case.dart';

import '../../../../core/di/app_di.dart';

class HistoryDi {
  static void setUp() {
    getIt.registerLazySingleton<HistoryDataSourceInterface>(
          () => LocalHistoryDataSource(),
    );

    // Repository
    getIt.registerLazySingleton<HistoryRepository>(
          () => HistoryRepositoryImp(
        getIt<HistoryDataSourceInterface>(),
      ),
    );

    // Use Cases
    getIt.registerLazySingleton<GetHistoryUseCase>(
          () => GetHistoryUseCase(
        getIt<HistoryRepository>(),
      ),
    );

    getIt.registerLazySingleton<AddHistoryUseCase>(
          () => AddHistoryUseCase(
        getIt<HistoryRepository>(),
      ),
    );




  }
}