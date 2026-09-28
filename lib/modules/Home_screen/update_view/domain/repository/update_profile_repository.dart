import 'package:movie_app/modules/Home_screen/update_view/domain/entities/update_profile_entity.dart';

import '../../../../../core/Network/api_results.dart';

abstract class UpdateProfileRepository {
  Future<ApiResults<UpdateProfileEntity>> getProfile();
  Future<ApiResults<bool>> updateProfile({required UpdateProfileEntity data});
  Future<ApiResults<bool>> deleteAccount();
}