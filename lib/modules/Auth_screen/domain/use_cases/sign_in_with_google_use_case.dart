import '../entities/user_entity.dart';
import '../repositories/auth_repositories.dart';

class SignInWithGoogleUseCase {

  final AuthRepositories authRepositories;
  SignInWithGoogleUseCase({required this.authRepositories});

  Future<UserEntity> call() async {
    return authRepositories.signInWithGoogle();
  }
}