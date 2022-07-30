import 'package:ifroom/app/modules/auth/domain/errors/sing_up_errors.dart';

class DataSourceError extends SingUpException{
  DataSourceError([super.message = "Network failed"]);
}