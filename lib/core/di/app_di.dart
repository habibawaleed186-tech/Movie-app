import 'package:get_it/get_it.dart';
import 'package:movie_app/modules/layout/browse/di/browse_di.dart';
import 'package:movie_app/modules/movie_details/di/movie_details_di.dart';

import '../../modules/layout/profile/di/favourite_di.dart';
import '../../modules/layout/profile/presentation/manager/profile_bloc.dart';
import '../../modules/layout/search/di/search_di.dart';
import '../Network/dio_api_client.dart';

var getIt =GetIt.instance;
class AppDi {
 static void init(){


   getIt.registerLazySingleton(
         ()=> DioApiClient(),
   );

   MovieDetailsDi.setUp();

   BrowseDi.setUp();

   SearchDi.setUp();

   FavouriteDi.setUp();
   if (!getIt.isRegistered<ProfileBloc>()) {
     getIt.registerLazySingleton<ProfileBloc>(
           () => ProfileBloc(),
     );
   }
 }

}