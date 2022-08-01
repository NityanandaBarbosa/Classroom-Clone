import 'package:ifroom/app/core/errors/failure.dart';

class ClassException implements Failure {
  final String message;
  final StackTrace? stackTrace;

  ClassException(this.message, [this.stackTrace]);
}

class ClassDoNothing extends ClassException {
  ClassDoNothing(super.message);
}
