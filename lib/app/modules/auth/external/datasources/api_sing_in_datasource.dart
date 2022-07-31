import 'package:ifroom/app/core/utils/dio_client.dart';
import 'package:ifroom/app/modules/auth/domain/entities/sing_in_user.dart';
import 'package:ifroom/app/modules/auth/domain/entities/access_token.dart';
import 'package:ifroom/app/modules/auth/infra/adapters/access_token_adapters.dart';
import 'package:ifroom/app/modules/auth/infra/adapters/sing_in_adpters.dart';
import 'package:ifroom/app/modules/auth/infra/datasources/sing_in_data_source.dart';
import 'package:ifroom/app/modules/auth/infra/errors/sing_in_data_source_exception.dart';

class ApiSingInDatasource implements SingInDataSource {
  final DioClient dio;

  ApiSingInDatasource(this.dio);
  @override
  Future<AccessToken> userSingIn(SingInParams params) async {
    final data = SingInParamsAdpters.toMap(params);
    final response = await dio.post(router: '/login', data: data);
    if (response.statusCode == 200) {
      return AccessTokenAdapter.fromMap(response.data);
    }
    throw SingInDataSourceException();
  }
}
