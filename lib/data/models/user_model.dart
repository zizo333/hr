import 'dart:convert';

class UserModel {
  final int id;
  final String userName;
  final String image;
  final String email;
  final String phone;
  final String apiToken;

  UserModel({
    required this.id,
    required this.userName,
    required this.image,
    required this.email,
    required this.phone,
    required this.apiToken,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': userName,
      'avatar': image,
      'email': email,
      'phone': phone,
      'api-token': apiToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map, [String? apiToken]) {
    return UserModel(
      id: map['id'] ?? 0,
      userName: map['username'] ?? '',
      image: map['avatar'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      apiToken: apiToken ?? map['api-token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
