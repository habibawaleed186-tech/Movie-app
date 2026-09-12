import '../../../../../core/Network/api_results.dart';
import '../entities/update_profile_entity.dart';
import '../repository/update_profile_repository.dart';

class GetProfileUseCase {

  final UpdateProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<ApiResults<UpdateProfileEntity>> execute() {
    return repository.getProfile();
  }
}