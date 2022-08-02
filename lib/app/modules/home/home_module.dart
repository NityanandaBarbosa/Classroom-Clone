import 'package:flutter_modular/flutter_modular.dart';
import 'package:ifroom/app/modules/home/domain/repositories/class_repository.dart';
import 'package:ifroom/app/modules/home/domain/usecases/get_classes.dart';
import 'package:ifroom/app/modules/home/external/datasource/api_class_data_source.dart';
import 'package:ifroom/app/modules/home/infra/datasources/class_data_source.dart';
import 'package:ifroom/app/modules/home/infra/repositories/class_repository_impl.dart';
import 'presenter/stores/home_store.dart';

import 'presenter/pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    //datasource
    Bind.factory<ClassDataSource>((i) => ApiClassDataSource(i())),
    //repositories
    Bind.factory<ClassRepository>((i) => ClassRepositoryImpl(i())),
    //usecase
    Bind.factory<GetClasses>(((i) => GetClassesImpl(i()))),
    //store
    Bind.lazySingleton((i) => HomeStore(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, args) => HomePage(store: Modular.get<HomeStore>())),
  ];
}
