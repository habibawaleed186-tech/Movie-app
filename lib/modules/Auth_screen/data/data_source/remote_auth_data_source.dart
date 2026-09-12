import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
    final userModel=UserModel(email: email, uId: uId,avatarIndex: avatarIndex,name:name,phone: phone );
await firestore.collection('users').doc(uId).set(userModel.toJson());
return userModel;

  }

  @override
  Future<void> resetPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }


  @override
  Future<UserModel> signInWithGoogle() async {

    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      throw Exception('Google Sign In was canceled by user');
    }

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential = await firebaseAuth.signInWithCredential(credential);
    final user = userCredential.user;

    if (user == null) {
      throw Exception('Google sign in failed, user is null.');
    }

    final uId = user.uid;
    final docSnapShot = await firestore.collection('users').doc(uId).get();

    if (docSnapShot.exists) {
      return UserModel.fromJson(docSnapShot.data()!);
    } else {
      final userModel = UserModel(
        email: user.email ?? '',
        uId: uId,
        avatarIndex: 0,
        name: user.displayName ?? 'Google user',
      );
      await firestore.collection('users').doc(uId).set(userModel.toJson());
      return userModel;
    }
  }
}
