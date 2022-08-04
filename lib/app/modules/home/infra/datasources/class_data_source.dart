import 'package:ifroom/app/modules/home/domain/entities/class.dart';

abstract class ClassDataSource {
  Future<List<Class>> getClasses();
  Future<Class> createClass(CreateClassEntity params);
  Future<Class> joinClass(String code);
}
