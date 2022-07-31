import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_up_user.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_up_errors.dart';
import 'package:ifroom/app/modules/auth/domain/usecases/user_sing_up.dart.dart';

class SingUpStore extends NotifierStore<SingUpException, SingUpParams> {
  final UserSingUp usecase;
  SingUpStore(this.usecase)
      : super(SingedUser(
            id: 1, email: "", password: "", name: ""));

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Future<void> userSingUp() async {
    final params = SingUpParams(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text);
    setLoading(true);
    final result = await usecase.call(params);
    result.fold((l) {
      setError(l);
      setError(DoNothing("Nothing"));
    }, (r) {
      update(r);
      Modular.to.pushNamed("/home/");
    });
    setLoading(false);
  }
}
