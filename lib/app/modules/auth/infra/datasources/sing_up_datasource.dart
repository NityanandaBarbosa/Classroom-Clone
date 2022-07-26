import 'package:ifroom/app/modules/auth/domain/entities/sing_up_user.dart';

abstract class SingUpDataSource {
  Future<SingedUser> userSingUp(SingUpParams params);
}
