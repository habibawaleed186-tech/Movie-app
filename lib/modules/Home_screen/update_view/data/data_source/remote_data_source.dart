import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/modules/Home_screen/update_view/data/data_source/update_profile_data_source_interface.dart';
import 'package:movie_app/modules/Home_screen/update_view/domain/entities/update_profile_entity.dart';

class RemoteDataSource implements UpdateProfileDataSourceInterface{
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  RemoteDataSource({required this.firebaseAuth, required this.firestore});
  @override
  Future<Response<dynamic>> updateProfile({required UpdateProfileEntity data})async {

    final user = firebaseAuth.currentUser;



    await firestore
        .collection('users')
        .doc(user!.uid)
        .update({
      'name': data.name,
      'phone': data.phone,
      'avatarIndex': data.avatarIndex,
    });

    return Response(
      requestOptions: RequestOptions(),
      statusCode: 200,
      data: {
        'message': 'Profile updated successfully',
      },
    );
  }

  @override
  Future<Response<dynamic>> getProfile() async{

    final user = firebaseAuth.currentUser;

    final doc = await firestore.collection('users').doc(user!.uid).get();

    return Response(
      requestOptions: RequestOptions(),
      statusCode: 200,
      data: doc.data(),
    );
  }

  @override
  Future<Response<dynamic>> deleteAccount()async {
    try {
      final user = firebaseAuth.currentUser;
      if (user == null) {
        return Response(
          requestOptions: RequestOptions(),
          statusCode: 401,
          data: {'message': 'User not found'},
        );
      }

      final uid = user.uid;

      await firestore.collection('users').doc(uid).delete();

      await user.delete();
      return Response(
        requestOptions: RequestOptions(),
        statusCode: 200,
        data: {
          'message': 'Account deleted successfully',
        },
      );
    } catch (e) {
      String errorMessage = 'Failed to delete account';
      if (e is FirebaseAuthException) {
        errorMessage = e.message ?? errorMessage;
        if (e.code == 'requires-recent-login') {
          errorMessage = 'Please re-authenticate to delete your account';
        }
      } else {
        errorMessage = e.toString();
      }

      return Response(
        requestOptions: RequestOptions(),
        statusCode: 500,
        data: {'message': errorMessage,},
      );
    }
  }


  }

