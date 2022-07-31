import 'package:ifroom/app/modules/auth/domain/errors/sing_in_errors.dart';

class SingInDataSourceException extends SingInException {
  SingInDataSourceException([super.message = "Network Failed"]);
}
