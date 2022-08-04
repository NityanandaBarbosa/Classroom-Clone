import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/infra/errors/class_data_source_errors.dart';
import 'package:ifroom/app/modules/home/infra/repositories/class_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/class_mocks.dart';

void main() {
  final datasource = ClassDataSourceMock();
  final repository = ClassRepositoryImpl(datasource);

  group("GetClasses -", () {
    test('Should return a List of one Class', () async {
      final list = <Class>[ClassMocks.oneClass];
      when(() => datasource.getClasses())
          .thenAnswer((invocation) async => list);
      final response = await repository.getClasses();
      expect(response.fold(id, id), isA<List<Class>>());
    });
    group("Exceptions -", () {
      test('Should throw an DioError', () async {
        when(() => datasource.getClasses()).thenThrow(ClassMocks.dioError);
        final response = await repository.getClasses();
        expect(response.fold(id, id), isA<ClassDataSourceException>());
      });

      test('Should throw an ClassDataSourException', () async {
        when(() => datasource.getClasses())
            .thenThrow(ClassDataSourceException());
        final response = await repository.getClasses();
        expect(response.fold(id, id), isA<ClassDataSourceException>());
      });

      test('Should throw an Exception', () async {
        when(() => datasource.getClasses()).thenThrow(Exception());
        final response = await repository.getClasses();
        expect(response.fold(id, id), isA<ClassDataSourceException>());
      });
    });
  });

  group("CreateClass -", () {
    test('Should return one Class', () async {
      when(() => datasource.createClass(ClassMocks.createClass))
          .thenAnswer((invocation) async => ClassMocks.oneClass);
      final response = await repository.createClass(ClassMocks.createClass);
      expect(response.fold(id, id), isA<Class>());
    });
    group("Exceptions -", () {
      test('Should throw an DioError', () async {
        when(() => datasource.getClasses()).thenThrow(ClassMocks.dioError);
        final response = await repository.getClasses();
        expect(response.fold(id, id), isA<ClassDataSourceException>());
      });
      test('Should throw an ClassDataSourException', () async {
        when(() => datasource.getClasses())
            .thenThrow(ClassDataSourceException());
        final response = await repository.getClasses();
        expect(response.fold(id, id), isA<ClassDataSourceException>());
      });
      test('Should throw an Exception', () async {
        when(() => datasource.getClasses()).thenThrow(Exception());
        final response = await repository.getClasses();
        expect(response.fold(id, id), isA<ClassDataSourceException>());
      });
    });
  });

  group("Join Class -", () {
    test('Should return a one Class', () async {
      when(() => datasource.joinClass("2"))
          .thenAnswer((invocation) async => ClassMocks.oneClass);
      final response = await repository.createClass(ClassMocks.createClass);
      expect(response.fold(id, id), isA<Class>());
    });
    group("Exceptions -", () {
      test('Should throw an DioError', () async {
        when(() => datasource.joinClass("2")).thenThrow(ClassMocks.dioError);
        final response = await repository.getClasses();
        expect(response.fold(id, id), isA<ClassDataSourceException>());
      });
      test('Should throw an ClassDataSourException', () async {
        when(() => datasource.joinClass("2"))
            .thenThrow(ClassDataSourceException());
        final response = await repository.getClasses();
        expect(response.fold(id, id), isA<ClassDataSourceException>());
      });
      test('Should throw an Exception', () async {
        when(() => datasource.joinClass("2")).thenThrow(Exception());
        final response = await repository.getClasses();
        expect(response.fold(id, id), isA<ClassDataSourceException>());
      });
    });
  });
}
