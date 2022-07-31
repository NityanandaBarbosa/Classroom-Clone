import 'package:dio/dio.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_in_errors.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_in_user.dart';
import 'package:ifroom/app/modules/auth/domain/entities/access_token.dart';
import 'package:dartz/dartz.dart';
import 'package:ifroom/app/modules/auth/domain/repositories/sing_in_repository.dart';
import 'package:ifroom/app/modules/auth/infra/datasources/sing_in_data_source.dart';
import 'package:ifroom/app/modules/auth/infra/errors/sing_in_data_source_exception.dart';

class SingInRepositoryImpl implements SingInRepository {
  final SingInDataSource dataSource;

  SingInRepositoryImpl(this.dataSource);
  @override
  Future<Either<SingInException, AccessToken>> userSingIn(
      SingInParams params) async {
    try {
      final response = await dataSource.userSingIn(params);
      return Right(response);
    } on DioError catch (e) {
      if (e.response?.statusCode == 401) {
        return const Left(InvalidCredentials());
      }
      return Left(SingInDataSourceException());
    } on SingInDataSourceException catch (e) {
      return Left(e);
    } on Exception {
      return Left(SingInDataSourceException());
    }
  }
}
