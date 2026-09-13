import 'package:movie_app/modules/Auth_screen/domain/entities/user_entity.dart';
import 'package:movie_app/modules/Auth_screen/domain/repositories/auth_repositories.dart';

class RegisterUseCase {

final  AuthRepositories authRepositories;
RegisterUseCase({required this.authRepositories});


Future<UserEntity> call({
  required String name,
  required String email,
  required String password,
  required String phone,
  required int avatarIndex,
})async{
  return authRepositories.register(name: name, email: email, password: password, phone: phone, avatarIndex: avatarIndex);
}

}