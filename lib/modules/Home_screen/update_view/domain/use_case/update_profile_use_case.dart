import 'package:movie_app/modules/Home_screen/update_view/domain/entities/update_profile_entity.dart';
import 'package:movie_app/modules/Home_screen/update_view/domain/repository/update_profile_repository.dart';

import '../../../../../core/Network/api_results.dart';

class UpdateProfileUseCase {
  final UpdateProfileRepository _updateProfileRepository;

  UpdateProfileUseCase(this._updateProfileRepository);


  Future<ApiResults<bool>> execute({required UpdateProfileEntity data})async {
   return await  _updateProfileRepository.updateProfile(data: data);
  }

}