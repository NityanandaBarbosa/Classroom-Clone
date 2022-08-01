import 'package:ifroom/app/modules/home/domain/entities/class.dart';

abstract class ClassDataSource {
  Future<List<Class>> getClasses();
}
