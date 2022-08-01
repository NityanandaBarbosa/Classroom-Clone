import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/domain/errors/class_errors.dart';
import 'package:ifroom/app/modules/home/domain/repositories/class_repository.dart';
import 'package:ifroom/app/modules/home/domain/usecases/get_classes.dart';
import 'package:mocktail/mocktail.dart';

class ClassRepositoryMock extends Mock implements ClassRepository {}

void main() {
  final repository = ClassRepositoryMock();
  final usecase = GetClassesImpl(repository);
  test('Should return a List of one Class', () async {
    final list = <Class>[Class(name: "teste", creator: "teste")];
    when(() => repository.getClasses()).thenAnswer((_) async => Right(list));
    final result = await usecase();
    expect(result.fold(id, id), isA<List<Class>>());
  });
  test('Should return a empty list of class', () async {
    final list = <Class>[];
    when(() => repository.getClasses()).thenAnswer((_) async => Right(list));
    final result = await usecase();
    expect(result.fold(id, id), isA<List<Class>>());
  });

  test('Should return a ClassException', () async {
    final exception = ClassException("Error");
    when(() => repository.getClasses())
        .thenAnswer((_) async => Left(exception));
    final result = await usecase();
    expect(result.fold(id, id), isA<ClassException>());
  });
}
