import 'package:dio/dio.dart';
import 'package:movie_app/modules/Home_screen/update_view/domain/entities/update_profile_entity.dart';

abstract  class UpdateProfileDataSourceInterface {

  Future<Response<dynamic>> updateProfile ({required UpdateProfileEntity data});
  Future<Response<dynamic>> getProfile();
  Future<Response<dynamic>> deleteAccount();
}