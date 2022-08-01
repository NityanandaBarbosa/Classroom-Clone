import 'package:dartz/dartz.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/domain/errors/class_errors.dart';
import 'package:ifroom/app/modules/home/domain/repositories/class_repository.dart';

abstract class GetClasses {
  Future<Either<ClassException, List<Class>>> call();
}

class GetClassesImpl implements GetClasses {
  final ClassRepository repository;

  GetClassesImpl(this.repository);
  @override
  Future<Either<ClassException, List<Class>>> call() async {
    return await repository.getClasses();
  }
}
