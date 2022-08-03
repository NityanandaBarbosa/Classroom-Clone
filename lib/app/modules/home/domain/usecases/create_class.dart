import 'package:dartz/dartz.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/domain/errors/class_errors.dart';
import 'package:ifroom/app/modules/home/domain/repositories/class_repository.dart';

abstract class CreateClass {
  Future<Either<ClassException, Class>> call(CreateClassEntity param);
}

class CreateClassImpl implements CreateClass {
  final ClassRepository repository;

  CreateClassImpl(this.repository);
  @override
  Future<Either<ClassException, Class>> call(CreateClassEntity param) async {
    if (param.name.isEmpty) {
      return Left(ClassEmptyName());
    }
    return await repository.createClass(param);
  }
}
