
import 'package:movie_app/modules/auth_screen/domain/entities/user_entity.dart';

import '../repositories/auth_repositories.dart';

class SignInWithGoogleUseCase {

  final AuthRepositories authRepositories;
  SignInWithGoogleUseCase({required this.authRepositories});

  Future<UserEntity> call() async {
    return await authRepositories.signInWithGoogle();
  }
}