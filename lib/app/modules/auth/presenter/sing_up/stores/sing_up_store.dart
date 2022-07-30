import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_up_user.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_up_errors.dart';
import 'package:ifroom/app/modules/auth/domain/usecases/user_sing_up.dart.dart';

class SingUpStore extends NotifierStore<SingUpException, SingedUser> {
  final UserSingUp usecase;
  SingUpStore(this.usecase)
      : super(SingedUser(
            id: 1, email: "teste", password: "teste", name: "teste"));

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
    setLoading(false);
    result.fold((l) {
      setError(l);
    }, (r) {
      update(r);
      Modular.to.pushNamed("/home");
      
    });
    
  }
}
