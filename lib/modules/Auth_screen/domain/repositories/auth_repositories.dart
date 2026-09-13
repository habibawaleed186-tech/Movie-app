import 'package:movie_app/modules/Auth_screen/domain/entities/user_entity.dart';

abstract class AuthRepositories {

  Future<UserEntity> login({required String email,required String password});

  Future<UserEntity> register({required String name,required String email,required String password, required String phone,required int avatarIndex});

  Future<UserEntity> signInWithGoogle();

  Future<void> resetPassword({required String email});

}