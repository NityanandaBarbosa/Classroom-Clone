import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/domain/errors/class_errors.dart';
import 'package:ifroom/app/modules/home/domain/usecases/get_classes.dart';

class HomeStore extends NotifierStore<Exception, List<Class>> {
  final GetClasses getClasses;
  HomeStore(this.getClasses) : super([]);

  Future<void> apiGetClasses() async {
    setLoading(true);

    final result = await getClasses();
    result.fold((l) {
      setError(l);
      setError(ClassDoNothing(""));
    }, (r) => update(r));
    setLoading(false);
  }
}
