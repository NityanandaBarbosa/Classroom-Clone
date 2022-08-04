import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/domain/errors/class_errors.dart';
import 'package:ifroom/app/modules/home/domain/usecases/join_class.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/class_mocks.dart';

void main() {
  final repository = ClassRepositoryMock();
  final usecase = JoinClassImpl(repository);
  const code = "3213213";
  test('Should return a Class', () async {
    when(() => repository.joinClass(code))
        .thenAnswer((invocation) async => Right(ClassMocks.oneClass));
    final result = await usecase(code);
    expect(result.fold(id, id), isA<Class>());
  });

  test('Should return a ClassException', () async {
    when(() => repository.joinClass(code))
        .thenAnswer((invocation) async => Left(ClassException("Error")));
    final result = await usecase(code);
    expect(result.fold(id, id), isA<ClassException>());
  });
}
