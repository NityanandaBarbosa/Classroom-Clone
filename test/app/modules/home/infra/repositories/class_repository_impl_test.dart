import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/infra/datasources/class_data_source.dart';
import 'package:ifroom/app/modules/home/infra/errors/class_data_source_errors.dart';
import 'package:ifroom/app/modules/home/infra/repositories/class_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class ClassDataSourceMock extends Mock implements ClassDataSource {}

void main() {
  final datasource = ClassDataSourceMock();
  final repository = ClassRepositoryImpl(datasource);
  test('Should return a List of one Class', () async {
    final list = <Class>[Class(id: 1, name: "teste", creator: "teste")];
    when(() => datasource.getClasses()).thenAnswer((invocation) async => list);
    final response = await repository.getClasses();
    expect(response.fold(id, id), isA<List<Class>>());
  });
  group("Exceptions -", () {
    test('Should throw an DioError', () async {
      final requestOptions = RequestOptions(path: '');
      when(() => datasource.getClasses()).thenThrow(DioError(
          requestOptions: requestOptions,
          response: Response(requestOptions: requestOptions)));
      final response = await repository.getClasses();
      expect(response.fold(id, id), isA<ClassDataSourceException>());
    });

    test('Should throw an ClassDataSourException', () async {
      when(() => datasource.getClasses()).thenThrow(ClassDataSourceException());
      final response = await repository.getClasses();
      expect(response.fold(id, id), isA<ClassDataSourceException>());
    });

    test('Should throw an Exception', () async {
      when(() => datasource.getClasses()).thenThrow(Exception());
      final response = await repository.getClasses();
      expect(response.fold(id, id), isA<ClassDataSourceException>());
    });
  });
}
