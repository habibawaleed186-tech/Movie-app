
import 'package:movie_app/modules/Auth_screen/data/models/user_model.dart';

abstract class AuthDataSourceInterface {

Future<UserModel> login({required String email,required String password});

Future<UserModel> register({required String name,required String email,required String password, required String phone,required int avatarIndex});

Future<UserModel> signInWithGoogle();

  Future<void> resetPassword({required String email}) ;

}