import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifroom/app/core/utils/dio_client.dart';
import 'package:ifroom/app/modules/auth/auth_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<Dio>((i) => Dio()),
    Bind.lazySingleton<DioClient>((i) => DioClient(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: AuthModule()),
    ModuleRoute("/home", module: HomeModule())
  ];

}