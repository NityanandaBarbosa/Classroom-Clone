import 'package:ifroom/app/modules/home/domain/errors/class_errors.dart';

class ClassDataSourceException extends ClassException {
  ClassDataSourceException([super.message = "Network failed"]);
}

class CreateClassDataSourceException extends ClassException {
  CreateClassDataSourceException(
      [super.message =
          "Algo deu errado. Verifique sua conexão com a internet e tente novamente."]);
}
