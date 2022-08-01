import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifroom/app/core/utils/dio_client.dart';
import 'package:ifroom/app/modules/auth/auth_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton<Dio>((i) => Dio(BaseOptions(
          connectTimeout: 15000,
          receiveTimeout: 15000,
        ))),
    Bind.singleton<DioClient>((i) => DioClient(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
    ModuleRoute("/home", module: HomeModule())
  ];
}
