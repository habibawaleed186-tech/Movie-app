import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/modules/Auth_screen/data/data_source/auth_data_source_interface.dart';
import 'package:movie_app/modules/Auth_screen/data/models/user_model.dart';

class RemoteAuthDataSource implements AuthDataSourceInterface {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  RemoteAuthDataSource({required this.firebaseAuth, required this.firestore});

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    final response = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    final uId = response.user!.uid;

    final docSnapShot = await firestore.collection('users').doc(uId).get();
    return UserModel.fromJson(docSnapShot.data()!);
  }

  @override
  Future<UserModel> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    required int avatarIndex,
  }) async {

    final response =await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    final uId=response.user!.uid;
    final userModel=UserModel(email: email, uId: uId,avatarIndex: avatarIndex,name:name );
await firestore.collection('users').doc(uId).set(userModel.toJson());
return userModel;


  }

  @override
  Future<UserModel> signInWithGoogle() {
    throw UnimplementedError();
  }
}
