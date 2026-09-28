import 'package:movie_app/modules/layout/profile/data/data_source/local_watch_list_data_source.dart';

import '../../../../core/di/app_di.dart';
import '../data/data_source/watch_list_data_source_interface.dart';
import '../data/repository_imp/watch_list_repository_imp.dart';
import '../domain/repository/watch_list_repository.dart';
import '../domain/use_case/add_favourite_use_case.dart';
import '../domain/use_case/get_favourite_use_case.dart';
import '../domain/use_case/is_favourite_use_case.dart';
import '../domain/use_case/remove_favourite_use_case.dart';
import '../presentation/manager/profile_bloc.dart';

class FavouriteDi {
  static void setUp() {
    getIt.registerLazySingleton<WatchListDataSourceInterface>(
          () => LocalWatchListDataSource(),
    );

    // Repository
    getIt.registerLazySingleton<WatchListRepository>(
          () => WatchListRepositoryImp(getIt<WatchListDataSourceInterface>(),),
    );

    // Use Cases
    getIt.registerLazySingleton<GetFavouriteUseCase>(
          () => GetFavouriteUseCase(getIt<WatchListRepository>(),),
    );

    getIt.registerLazySingleton<AddFavouriteUseCase>(
          () => AddFavouriteUseCase(getIt<WatchListRepository>(),),
    );

    getIt.registerLazySingleton<RemoveFavouriteUseCase>(
          () => RemoveFavouriteUseCase(getIt<WatchListRepository>(),),
    );

    getIt.registerLazySingleton<IsFavouriteUseCase>(
          () => IsFavouriteUseCase(getIt<WatchListRepository>(),),
    );

    // Profile Bloc
    getIt.registerLazySingleton<ProfileBloc>(
          () => ProfileBloc(),
    );
  }
}