import 'package:dio/dio.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/domain/repositories/class_repository.dart';
import 'package:ifroom/app/modules/home/infra/datasources/class_data_source.dart';
import 'package:mocktail/mocktail.dart';

class ClassRepositoryMock extends Mock implements ClassRepository {}

class ClassDataSourceMock extends Mock implements ClassDataSource {}

class ClassMocks {
  static final createClass = CreateClassEntity("teste");
  static final requestOptions = RequestOptions(path: '');
  static final dioError = DioError(
      requestOptions: requestOptions,
      response: Response(requestOptions: requestOptions));
  static final oneClass = Class(
      id: 1,
      name: "teste",
      creator: "teste",
      section: "teste",
      subject: "",
      room: "");
}
