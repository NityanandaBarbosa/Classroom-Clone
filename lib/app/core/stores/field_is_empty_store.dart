import 'package:flutter_triple/flutter_triple.dart';
import 'package:ifroom/app/core/errors/failure.dart';

class FieldIsEmptyStore extends NotifierStore<Failure, bool> {
  FieldIsEmptyStore() : super(false);

  void isEmpty(String text) {
    if (text.isEmpty) {
      update(false);
    } else {
      update(true);
    }
  }
}
