import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/domain/errors/class_errors.dart';
import 'package:ifroom/app/modules/home/domain/usecases/create_class.dart';
import 'package:mocktail/mocktail.dart';
import '../../mocks/class_mocks.dart';

void main() {
  final repository = ClassRepositoryMock();
  final usecase = CreateClassImpl(repository);
  final param = CreateClassEntity("name");
  test('Should return a Class', () async {
    when(() => repository.createClass(param))
        .thenAnswer((invocation) async => Right(ClassMocks.oneClass));
    final result = await usecase(param);
    expect(result.fold(id, id), isA<Class>());
  });

  test("Should return a ClassEmptyName", () async {
    final param = CreateClassEntity("");
    final result = await usecase(param);
    expect(result.fold(id, id), isA<ClassEmptyName>());
  });

  test('Should return a ClassException', () async {
    when(() => repository.createClass(param))
        .thenAnswer((invocation) async => Left(ClassException("")));
    final result = await usecase(param);
    expect(result.fold(id, id), isA<ClassException>());
  });
}
