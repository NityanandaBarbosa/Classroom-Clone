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
    } on DioError catch (e) {
      return Left(ClassDataSourceException());
    } on Exception {
      return Left(ClassDataSourceException());
    }
  }
}