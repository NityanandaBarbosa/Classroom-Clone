import 'package:ifroom/app/core/errors/failure.dart';

class SingInException implements Failure {
  final String message;
  final StackTrace? stackTrace;

  const SingInException(this.message, [this.stackTrace]);
}

class DoNothing extends SingInException {
  DoNothing(super.message);
}

class MissingRequiredValue extends SingInException {
  const MissingRequiredValue(super.message, [super.stackTrace]);
}

class InvalidCredentials extends SingInException {
  const InvalidCredentials(
      [super.message = "Invalid email/password", super.stackTrace]);
}
