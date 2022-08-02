import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/core/errors/token_expired_or_invalid.dart';
import 'package:ifroom/app/modules/auth/domain/entities/access_token.dart';

class AuthStore extends NotifierStore<TokenExpiredOrInvalid, AccessToken> {
  AuthStore() : super(AccessToken(accessToken: "", expiresAt: DateTime.now()));

  String get accessToken => "Bearer " + state.accessToken;
}
