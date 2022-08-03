import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/domain/repositories/class_repository.dart';
import 'package:mocktail/mocktail.dart';

class ClassRepositoryMock extends Mock implements ClassRepository {}

class ClassMocks {
  static final oneClass = Class(
      id: 1,
      name: "teste",
      creator: "teste",
      section: "teste",
      subject: "",
      room: "");
}
