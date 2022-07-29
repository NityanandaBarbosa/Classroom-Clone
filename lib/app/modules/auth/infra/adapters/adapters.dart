import 'package:ifroom/app/modules/auth/domain/entities/sing_up_user.dart';

class SingedUserAdapter {
  static SingedUser fromMap(Map<String, dynamic> map) {
    return SingedUser(
      id: map['id']?.toInt(),
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      userFullName: map['userFullName'] ?? '',
    );
  }
}

class SingUpParamsAdpter {
  static SingUpParams fromMap(Map<String, dynamic> map) {
    return SingUpParams(
        email: map["email"],
        password: map["password"],
        userFullName: map["userFullName"]);
  }

  static Map<String, dynamic> toMap(SingUpParams params)=> <String, dynamic>{
    "email": params.email,
    "password": params.password,
    "userFullName": params.userFullName
  };
}
