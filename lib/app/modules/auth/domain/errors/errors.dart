import 'package:ifroom/app/core/failure.dart';

abstract class SingUpException implements Failure {
  final String message;
  final StackTrace? stackTrace;

  const SingUpException(this.message, [this.stackTrace]);
}

class MissingRequiredValue extends SingUpException{
  const MissingRequiredValue(super.message, [super.stackTrace]);
}