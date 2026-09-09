import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/routes/app_router.dart';
import 'package:movie_app/core/routes/app_routes.dart';
import 'package:movie_app/modules/Home_screen/update_view/update.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'modules/Auth_screen/data/data_source/auth_data_source_interface.dart';
import 'modules/Auth_screen/data/data_source/remote_auth_data_source.dart';
import 'modules/Auth_screen/data/repositories_imp/auth_repositories_imp.dart';
import 'modules/Auth_screen/domain/use_cases/login_use_case.dart';
import 'modules/Auth_screen/domain/use_cases/register_use_case.dart';
import 'modules/Auth_screen/domain/use_cases/reset_password_use_case.dart';
import 'modules/Auth_screen/presentation/manager/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) {
            final remoteDataSource = RemoteAuthDataSource(
              firebaseAuth: FirebaseAuth.instance,
              firestore: FirebaseFirestore.instance,
            );

            final repository = AuthRepositoriesImp(
              remoteAuthDataSource: remoteDataSource,
            );

            return AuthBloc(
              loginUseCase: LoginUseCase(repository),
              registerUseCase: RegisterUseCase(authRepositories: repository),
              resetPasswordUseCase: ResetPasswordUseCase(repositories: repository),
            );
          },
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.Splach,
            onGenerateRoute: AppRouter.onGenerateRoute,
          ),
        );
      },
    );
  }
}
