import 'package:ifroom/app/core/utils/dio_client.dart';
import 'package:ifroom/app/modules/home/domain/entities/class.dart';
import 'package:ifroom/app/modules/home/infra/adapters/class_adapter.dart';
import 'package:ifroom/app/modules/home/infra/datasources/class_data_source.dart';
import 'package:ifroom/app/modules/home/infra/errors/class_data_source_errors.dart';

class ApiClassDataSource implements ClassDataSource {
  final DioClient dio;

  ApiClassDataSource(this.dio);
  @override
  Future<List<Class>> getClasses() async {
    final response = await dio.post(route: '/discipline');
    if (response.statusCode == 200) {
      final list = response.data as List;
      return list.map((e) => ClassAdapter.fromMap(e)).toList();
    }
    throw ClassDataSourceException();
  }
}