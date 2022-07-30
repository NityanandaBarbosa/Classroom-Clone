// ignore_for_file: overridden_fields
import 'package:ifroom/app/core/errors/failure.dart';

class SingUpException implements Failure {
  final String message;
  final StackTrace? stackTrace;

  const SingUpException(this.message, [this.stackTrace]);
}

class DoNothing extends SingUpException{
  DoNothing(super.message);
}

class MissingRequiredValue extends SingUpException {
  const MissingRequiredValue(super.message, [super.stackTrace]);
}

class EmailOutOfPattern extends SingUpException {
  const EmailOutOfPattern(super.message, [super.stackTrace]);
}

class PasswordOutOfPattern extends SingUpException {
  const PasswordOutOfPattern(super.message, [super.stackTrace]);
}

class EmailAlreadyUsed extends SingUpException {
  const EmailAlreadyUsed(
      [super.message = "Email already in use", super.stackTrace]);
}
