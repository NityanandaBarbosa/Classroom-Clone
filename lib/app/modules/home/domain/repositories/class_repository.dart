import 'package:dartz/dartz.dart';

import '../entities/class.dart';
import '../errors/class_errors.dart';

abstract class ClassRepository {
  Future<Either<ClassException, List<Class>>> getClasses();
}
