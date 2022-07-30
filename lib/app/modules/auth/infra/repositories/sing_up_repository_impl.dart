import 'package:dio/dio.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_up_errors.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_up_user.dart';
import 'package:dartz/dartz.dart';
import 'package:ifroom/app/modules/auth/domain/repositories/sing_up_repository.dart';
import 'package:ifroom/app/modules/auth/infra/datasources/sing_up_datasource.dart';
import 'package:ifroom/app/modules/auth/infra/errors/sing_up_infra_errors.dart';

class SingUpRepositoryImpl implements SingUpRepository {
  final SingUpDataSource dataSource;

  SingUpRepositoryImpl(this.dataSource);

  @override
  Future<Either<SingUpException, SingedUser>> userSingUp(
      SingUpParams params) async {
    try {
      final result = await dataSource.userSingUp(params);
      return Right(result);
    } on DioError catch (e) {
      if(e.response?.statusCode == 406){
        return const Left(EmailAlreadyUsed());
      }
      if(e.response?.statusCode == 500){
        return Left(DataSourceError());
      }
      return Left(DataSourceError());
    } on DataSourceError catch (e) {
      return Left(e);
    } on Exception {
      return Left(DataSourceError("Unknow exception"));
    }
  }
}
