import 'package:dartz/dartz.dart';

import '../entities/sing_up_user.dart';
import '../errors/sing_up_errors.dart';

abstract class SingUpRepository {
  Future<Either<SingUpException, SingedUser>> userSingUp(SingUpParams parms);
}
