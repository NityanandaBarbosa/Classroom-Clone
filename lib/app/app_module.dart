import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifroom/app/core/stores/auth_store.dart';
import 'package:ifroom/app/core/utils/dio_client.dart';
import 'package:ifroom/app/modules/auth/auth_module.dart';
import 'package:ifroom/app/core/stores/field_is_empty_store.dart';
import 'core/constants/app_consts.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<Dio>((i) => Dio(BaseOptions(
        connectTimeout: 15000,
        receiveTimeout: 15000,
        baseUrl: AppConsts.apiUrl))),
    Bind.singleton<HttpClient>((i) => DioClient(i(), i())),
    Bind.singleton<AuthStore>((i) => AuthStore()),
    Bind.factory((i) => FieldIsEmptyStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
    ModuleRoute("/home", module: HomeModule())
  ];
}
