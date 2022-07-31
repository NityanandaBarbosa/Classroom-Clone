import 'package:ifroom/app/core/utils/dio_client.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_up_user.dart';
import 'package:ifroom/app/modules/auth/infra/adapters/sing_up_adapters.dart';
import 'package:ifroom/app/modules/auth/infra/datasources/sing_up_datasource.dart';
import 'package:ifroom/app/modules/auth/infra/errors/sing_up_infra_errors.dart';

class ApiSingUpDatasource implements SingUpDataSource {
  final HttpClient dio;
  ApiSingUpDatasource(this.dio);

  @override
  Future<SingedUser> userSingUp(SingUpParams params) async {
    final data = SingUpParamsAdpter.toMap(params);
    final response = await dio.post(router: "/auth/sing-up", data: data);
    if (response.statusCode == 201) {
      return SingedUserAdapter.fromMap(response.data);
    } else {
      throw DataSourceError();
    }
  }
}
