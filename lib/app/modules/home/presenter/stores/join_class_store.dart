import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/domain/errors/class_errors.dart';
import 'package:ifroom/app/modules/home/domain/usecases/join_class.dart';

class JoinClassStore extends NotifierStore<ClassException, Class> {
  final JoinClassImpl usecase;
  JoinClassStore(this.usecase)
      : super(Class(
          id: 0,
          name: "",
          creator: "",
          section: "",
          room: "",
          subject: "",
        ));

  Future<void> createClass(String code) async {
    setLoading(true);
    final result = await usecase(code);
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
