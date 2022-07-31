import 'package:ifroom/app/modules/auth/domain/entities/sing_in_user.dart';

class SingInParamsAdpters {
  static SingInParams fromMap(Map<String, dynamic> map) {
    return SingInParams(
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  static Map<String, dynamic> toMap(SingInParams params) => <String, dynamic>{
        "email": params.email,
        "password": params.password,
      };
}
