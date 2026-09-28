class UserEntity {

  final String uId;
  final String email;
  final String? name;
  final int? avatarIndex;
  final String phone;


  UserEntity({this.name, required this.email, this.avatarIndex, required this.uId ,required this.phone});



}