import 'package:ifroom/app/modules/auth/domain/entities/access_token.dart';

class AccessTokenAdapter {
  static AccessToken fromMap(Map<String, dynamic> map) {
    return AccessToken(
      accessToken: map["access_token"],
      expiresAt: DateTime.parse(map["expires_at"]),
    );
  }
}
