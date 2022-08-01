import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifroom/app/modules/auth/domain/repositories/sing_in_repository.dart';
import 'package:ifroom/app/modules/auth/domain/repositories/sing_up_repository.dart';
import 'package:ifroom/app/modules/auth/domain/usecases/user_sing_in.dart';
import 'package:ifroom/app/modules/auth/domain/usecases/user_sing_up.dart.dart';
import 'package:ifroom/app/modules/auth/external/datasources/api_sing_in_datasource.dart';
import 'package:ifroom/app/modules/auth/external/datasources/api_sing_up_datasource.dart';
import 'package:ifroom/app/modules/auth/infra/datasources/sing_in_data_source.dart';
import 'package:ifroom/app/modules/auth/infra/datasources/sing_up_datasource.dart';
import 'package:ifroom/app/modules/auth/infra/repositories/sing_in_repository_impl.dart';
import 'package:ifroom/app/modules/auth/infra/repositories/sing_up_repository_impl.dart';
import 'package:ifroom/app/modules/auth/presenter/pages/sing_in_page.dart';
import 'package:ifroom/app/modules/auth/presenter/pages/sing_up_page.dart';
import 'package:ifroom/app/modules/auth/presenter/stores/sing_in_store.dart';
import 'package:ifroom/app/modules/auth/presenter/stores/sing_up_store.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    //datasource
    Bind.factory<SingUpDataSource>((i) => ApiSingUpDatasource(i())),
    Bind.factory<SingInDataSource>((i) => ApiSingInDatasource(i())),
    //repositories
    Bind.factory<SingUpRepository>((i) => SingUpRepositoryImpl(i())),
    Bind.factory<SingInRepository>((i) => SingInRepositoryImpl(i())),
    //usecase
    Bind.factory<UserSingUp>(((i) => UserSingUpImpl(i()))),
    Bind.factory<UserSingIn>(((i) => UserSingInImpl(i()))),
    //store
    Bind.factory<SingUpStore>((i) => SingUpStore(i())),
    Bind.factory<SingInStore>((i) => SingInStore(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => SingInPage(store: Modular.get<SingInStore>())),
    ChildRoute('/sing-up',
        child: (_, args) => SingUpPage(store: Modular.get<SingUpStore>())),
  ];
}
