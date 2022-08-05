import 'package:ifroom/app/core/errors/failure.dart';

class ClassException implements Failure {
  final String message;
  final StackTrace? stackTrace;

  ClassException(this.message, [this.stackTrace]);
}

class ClassDoNothing extends ClassException {
  ClassDoNothing(super.message);
}

class ClassEmptyName extends ClassException {
  ClassEmptyName([super.message = "Preencha o campo nome!"]);
}

class CodeOutPattern extends ClassException {
  CodeOutPattern([super.message = "O código da classe está fora do padrão!"]);
}

class ClassNotFound extends ClassException {
  ClassNotFound([super.message = "Sala não foi encontrada!"]);
}

class AlreadyInClass extends ClassException {
  AlreadyInClass([super.message = "Você já está na sala!"]);
}
