import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/modules/Home_screen/update_view/presentation/manager/update_profile_bloc.dart';

import '../../../core/di/app_di.dart';
import 'data/data_source/remote_data_source.dart';
import 'data/data_source/update_profile_data_source_interface.dart';
import 'data/repository_implementation/update_profile_repository_imp.dart';
import 'domain/repository/update_profile_repository.dart';
import 'domain/use_case/delete_account_use_case.dart';
import 'domain/use_case/get_profile_use_case.dart';
import 'domain/use_case/update_profile_use_case.dart';

class UpdateProfileDi {
  static void setUp() {
    getIt
      ..registerLazySingleton<UpdateProfileDataSourceInterface>(
            () => RemoteDataSource(
          firebaseAuth: FirebaseAuth.instance,
          firestore: FirebaseFirestore.instance,
        ),
      )
      ..registerLazySingleton<UpdateProfileRepository>(
            () => UpdateProfileRepositoryImp(
          getIt<UpdateProfileDataSourceInterface>(),
        ),
      )
      ..registerLazySingleton<GetProfileUseCase>(
            () => GetProfileUseCase(
          getIt<UpdateProfileRepository>(),
        ),
      )
      ..registerLazySingleton<UpdateProfileUseCase>(
            () => UpdateProfileUseCase(
          getIt<UpdateProfileRepository>(),
        ),
      )
      ..registerLazySingleton<DeleteAccountUseCase>(
            () => DeleteAccountUseCase(
          getIt<UpdateProfileRepository>(),
        ),
      )
      ..registerLazySingleton<UpdateProfileBloc>(
            () => UpdateProfileBloc(),
      );
  }
}