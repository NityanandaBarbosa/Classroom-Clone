import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifroom/app/modules/auth/domain/repositories/sing_up_repository.dart';
import 'package:ifroom/app/modules/auth/domain/usecases/user_sing_up.dart.dart';
import 'package:ifroom/app/modules/auth/external/datasources/api_sing_up_datasource.dart';
import 'package:ifroom/app/modules/auth/infra/datasources/sing_up_datasource.dart';
import 'package:ifroom/app/modules/auth/infra/repositories/sing_up_repository_impl.dart';
import 'package:ifroom/app/modules/auth/presenter/pages/sing_up_page.dart';
import 'package:ifroom/app/modules/auth/presenter/stores/sing_up_store.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    //datasource
    Bind.factory<SingUpDataSource>((i) => ApiSingUpDatasource(i())),
    //repositories
    Bind.factory<SingUpRepository>((i) => SingUpRepositoryImpl(i())),
    //usecase
    Bind.factory<UserSingUp>(((i) => UserSingUpImpl(i()))),
    //store
    Bind.factory<SingUpStore>((i) => SingUpStore(i()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => SingUpPage(store: Modular.get<SingUpStore>())),
  ];
}
