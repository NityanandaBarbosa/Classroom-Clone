import 'package:dio/dio.dart';
import 'package:ifroom/app/modules/home/domain/errors/class_errors.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:dartz/dartz.dart';
import 'package:ifroom/app/modules/home/domain/repositories/class_repository.dart';
import 'package:ifroom/app/modules/home/infra/datasources/class_data_source.dart';
import 'package:ifroom/app/modules/home/infra/errors/class_data_source_errors.dart';

class ClassRepositoryImpl implements ClassRepository {
  final ClassDataSource dataSource;

  ClassRepositoryImpl(this.dataSource);
  @override
  Future<Either<ClassException, List<Class>>> getClasses() async {
    try {
      final response = await dataSource.getClasses();
      return Right(response);
    } on ClassDataSourceException catch (e) {
      return Left(e);
    } on DioError {
      return Left(ClassDataSourceException());
    } on Exception {
      return Left(ClassDataSourceException());
    }
  }

  @override
  Future<Either<ClassException, Class>> createClass(
      CreateClassEntity param) async {
    try {
      final response = await dataSource.createClass(param);
      return Right(response);
    } on ClassDataSourceException catch (e) {
      return Left(e);
    } on DioError {
      return Left(CreateClassDataSourceException());
    } on Exception {
      return Left(ClassDataSourceException());
    }
  }

  @override
  Future<Either<ClassException, Class>> joinClass(String code) async {
    try {
      final response = await dataSource.joinClass(code);
      return Right(response);
    } on ClassDataSourceException catch (e) {
      return Left(e);
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        return Left(CodeOutPattern());
      }
      if (e.response?.statusCode == 404) {
        return Left(ClassNotFound());
      }
      if (e.response?.statusCode == 405) {
        return Left(AlreadyInClass());
      }
      return Left(CreateClassDataSourceException());
    } on Exception {
      return Left(ClassDataSourceException());
    }
  }
}
