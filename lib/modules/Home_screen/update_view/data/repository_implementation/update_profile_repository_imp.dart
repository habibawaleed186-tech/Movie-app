import 'package:dio/dio.dart';
import 'package:movie_app/core/Network/api_results.dart';
import 'package:movie_app/modules/Home_screen/update_view/data/data_source/update_profile_data_source_interface.dart';
import 'package:movie_app/modules/Home_screen/update_view/domain/entities/update_profile_entity.dart';
import 'package:movie_app/modules/Home_screen/update_view/domain/repository/update_profile_repository.dart';

import '../../../../../core/failures/server_faliuer.dart';

class UpdateProfileRepositoryImp implements UpdateProfileRepository{
  final UpdateProfileDataSourceInterface _dataSourceInterface;
  UpdateProfileRepositoryImp(this._dataSourceInterface);

  @override
  Future<ApiResults<UpdateProfileEntity>> getProfile() async{
    try {
      final response = await _dataSourceInterface.getProfile();
      if (response.statusCode == 200) {
        final data = response.data;
        final profile = UpdateProfileEntity(
          name: data['name'] ?? '',
          avatarIndex: data['avatarIndex'] ?? 0,
          phone:  data['phone'] ?? '',
        );
        return ApiResults.success(data: profile,);
      }

      final exception = ServerFailure(
        statusCode: response.statusCode.toString(),
        message: response.data['message'],
      );

      return ApiResults.failure(exception: exception,);

    } on DioException catch (error) {

      final exception = ServerFailure(
        statusCode:
        error.response?.statusCode.toString() ?? '500',
        message:
        error.response?.data['message'] ??
            error.message ??
            'Something went wrong',
      );

      return ApiResults.failure(
        exception: exception,
      );
    } catch (e) {
      return ApiResults.failure(
        exception: ServerFailure(
          statusCode: '500',
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<ApiResults<bool>> updateProfile({required UpdateProfileEntity data})async {
   try{
     final response = await _dataSourceInterface.updateProfile(data: data,);
     if (response.statusCode == 200) {
       return ApiResults.success(data: true,);
     }

     final exception = ServerFailure(
       statusCode: response.statusCode.toString(),
       message: response.data['message'],
     );

     return ApiResults.failure(exception: exception,);

   } on DioException catch (error) {

  final exception = ServerFailure(
  statusCode: error.response?.statusCode.toString() ?? '500',
  message: error.response?.data['message'] ??
  error.message ?? 'Something went wrong',
  );

  return ApiResults.failure(
  exception: exception);
  } catch (e) {
     return ApiResults.failure(
       exception: ServerFailure(
         statusCode: '500',
         message: e.toString(),
       ),
     );
   }


}

  @override
  Future<ApiResults<bool>> deleteAccount()async {
    try {
      final response =
      await _dataSourceInterface.deleteAccount();

      if (response.statusCode == 200) {
        return ApiResults.success(data: true,);
      }

      final exception = ServerFailure(
        statusCode: response.statusCode.toString(),
        message: response.data['message'],
      );

      return ApiResults.failure(exception: exception,);

    } on DioException catch (error) {

      final exception = ServerFailure(
        statusCode: error.response?.statusCode.toString() ?? '500',
        message: error.response?.data['message'] ??
        error.message ?? 'Something went wrong',
      );

      return ApiResults.failure(exception: exception,);
    } catch (e) {
      return ApiResults.failure(
        exception: ServerFailure(
          statusCode: '500',
          message: e.toString(),
        ),
      );
    }
  }

}
