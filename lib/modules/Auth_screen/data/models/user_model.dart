import 'package:movie_app/modules/Auth_screen/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({required super.email, required super.uId,super.name,super.avatarIndex,  required super.phone});


  factory UserModel.fromJson(Map<String,dynamic>json)
  {
    return UserModel(
      email: json['email'],
      uId: json['uId'],
      name: json['name'],
      phone:json['phone'],
      avatarIndex: json['avatarIndex'],
    );
  }

Map<String,dynamic>toJson()
  {
    return {
      'email':email,
      'uId':uId,
      'name':name,
      'phone':phone,
      'avatarIndex':avatarIndex,
    };
  }
}