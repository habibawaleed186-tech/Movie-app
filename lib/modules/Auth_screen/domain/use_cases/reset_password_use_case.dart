import 'package:movie_app/modules/Auth_screen/domain/repositories/auth_repositories.dart';

class ResetPasswordUseCase {
  final AuthRepositories repositories;

  ResetPasswordUseCase({required this.repositories});

  Future<void> call({required String email}) async {
    await repositories.resetPassword(email: email);
  }
}
