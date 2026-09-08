import 'package:movie_app/modules/Auth_screen/data/data_source/remote_auth_data_source.dart';
import 'package:movie_app/modules/Auth_screen/domain/entities/user_entity.dart';

import '../../domain/repositories/auth_repositories.dart';
import '../data_source/auth_data_source_interface.dart';

class AuthRepositoriesImp implements AuthRepositories{

final AuthDataSourceInterface remoteAuthDataSource;

AuthRepositoriesImp({required this.remoteAuthDataSource});

  @override
  Future<UserEntity> login({required String email, required String password}) async{

    return remoteAuthDataSource.login(email: email, password: password);
  }

  @override
  Future<UserEntity> register({required String name, required String email, required String password, required String phone, required int avatarIndex})async {

    return remoteAuthDataSource.register(name: name, email: email, password: password, phone: phone, avatarIndex: avatarIndex);
  }

  @override
  Future<UserEntity> signInWithGoogle() async{

    return remoteAuthDataSource.signInWithGoogle();
  }
}