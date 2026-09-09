class UserEntity {

  final String uId;
  final String email;
  final String? name;
  final int? avatarIndex;

  UserEntity({this.name, required this.email, this.avatarIndex, required this.uId});



}