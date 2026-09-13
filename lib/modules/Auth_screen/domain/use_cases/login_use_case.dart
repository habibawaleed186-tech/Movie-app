import 'package:movie_app/modules/Auth_screen/domain/entities/user_entity.dart';
import 'package:movie_app/modules/Auth_screen/domain/repositories/auth_repositories.dart';

class LoginUseCase {

final AuthRepositories authRepositories;

LoginUseCase( this.authRepositories);


  Future<UserEntity>call({
required String email,
required String password,
  })async
  {
    return authRepositories.login(email: email, password: password);
  }
}
