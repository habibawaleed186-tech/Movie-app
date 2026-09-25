import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/routes/app_router.dart';
import 'package:movie_app/core/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'modules/auth_screen/data/data_source/remote_auth_data_source.dart';
import 'modules/auth_screen/data/repositories_imp/auth_repositories_imp.dart';
import 'modules/auth_screen/domain/use_cases/login_use_case.dart';
import 'modules/auth_screen/domain/use_cases/register_use_case.dart';
import 'modules/auth_screen/domain/use_cases/sign_in_with_google_use_case.dart';
import 'modules/auth_screen/domain/use_cases/reset_password_use_case.dart';
import 'modules/auth_screen/presentation/manager/auth_bloc.dart';
import 'core/di/app_di.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  AppDi.init();
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
              resetPasswordUseCase: ResetPasswordUseCase(repositories: repository), signInWithGoogleUseCase: SignInWithGoogleUseCase(authRepositories: repository),
            );
          },
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes.splash,
            onGenerateRoute: AppRouter.onGenerateRoute,
            builder: EasyLoading.init(
              builder: BotToastInit(),
            ),
            navigatorObservers: [BotToastNavigatorObserver()],
          ),
        );},
    );
  }
}
