import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/core/errors/token_expired_or_invalid.dart';
import 'package:ifroom/app/modules/auth/domain/entities/access_token.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_up_user.dart';

class AuthStore extends NotifierStore<TokenExpiredOrInvalid, AccessToken> {
  AuthStore() : super(AccessToken(accessToken: "", expiresAt: DateTime.now()));
  late SingedUser _user;
  void setSingedUser(SingedUser user) => _user = user;

  String get email => _user.email;
  String get name => _user.name;
  String get accessToken => "Bearer " + state.accessToken;
}
