import 'package:dio/dio.dart';
import 'package:ifroom/app/core/constants/app_consts.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_up_user.dart';
import 'package:ifroom/app/modules/auth/domain/errors/sing_up_errors.dart';
import 'package:ifroom/app/modules/auth/infra/adapters/adapters.dart';
import 'package:ifroom/app/modules/auth/infra/datasources/sing_up_datasource.dart';
import 'package:ifroom/app/modules/auth/infra/errors/sing_up_infra_errors.dart';

class ApiSingUpDatasource implements SingUpDataSource {
  final Dio dio;

  ApiSingUpDatasource(this.dio);

  @override
  Future<SingedUser> userSingUp(SingUpParams params) async {
    final response = await dio.post(AppConsts.apiUrl,
        data: SingUpParamsAdpter.toMap(params));
    if (response.statusCode == 200) {
      return SingedUserAdapter.fromMap(response.data);
    } else if (response.statusCode == 406) {
      throw const EmailAlreadyUsed();
    } else {
      throw DataSourceError();
    }
  }
}
