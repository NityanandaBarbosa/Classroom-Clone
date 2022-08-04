import 'package:dartz/dartz.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/domain/errors/class_errors.dart';
import 'package:ifroom/app/modules/home/domain/repositories/class_repository.dart';

abstract class JoinClass {
  Future<Either<ClassException, Class>> call(String code);
}

class JoinClassImpl implements JoinClass {
  final ClassRepository repository;

  JoinClassImpl(this.repository);

  @override
  Future<Either<ClassException, Class>> call(String code) async {
    return await repository.joinClass(code);
  }
}
