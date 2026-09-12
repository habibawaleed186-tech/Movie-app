import '../../../../../core/Network/api_results.dart';
import '../repository/update_profile_repository.dart';

class DeleteAccountUseCase {

  final UpdateProfileRepository repository;

  DeleteAccountUseCase(this.repository);

  Future<ApiResults<bool>> execute() {
    return repository.deleteAccount();
  }
}