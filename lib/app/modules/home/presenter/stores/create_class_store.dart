import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/domain/errors/class_errors.dart';

import '../../domain/usecases/create_class.dart';

class CreateClassStore extends NotifierStore<ClassException, Class> {
  final CreateClassImpl usecase;
  CreateClassStore(this.usecase)
      : super(Class(
            id: 1, name: "", creator: "", section: "", room: "", subject: ""));

  Future<void> createClass(CreateClassEntity param) async {
    setLoading(true);
    final result = await usecase(param);
    result.fold((l) {
      setError(l);
      setError(ClassDoNothing(""));
    }, (r) {
      update(r);
      Modular.to.pushReplacementNamed('/home/');
    });
    setLoading(false);
  }
}
