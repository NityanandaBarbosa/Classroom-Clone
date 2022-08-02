import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/core/stores/auth_store.dart';
import 'package:ifroom/app/modules/auth/domain/entities/access_token.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_in_user.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_in_errors.dart';
import 'package:ifroom/app/modules/auth/domain/usecases/user_sing_in.dart';

class SingInStore extends NotifierStore<SingInException, AccessToken> {
  final UserSingIn usecase;
  final AuthStore authStore;
  SingInStore(this.usecase, this.authStore)
      : super(AccessToken(
          accessToken: "",
          expiresAt: DateTime.now(),
        ));

  Future<void> userSingIn(String email, String password) async {
    final params = SingInParams(
      email: email,
      password: password,
    );
    setLoading(true);
    final result = await usecase.call(params);
    result.fold((l) {
      setError(l);
      setError(DoNothing("Nothing"));
    }, (r) {
      update(r);
      authStore.update(r);
      Modular.to.pushNamed("/home/");
    });
    setLoading(false);
  }
}
