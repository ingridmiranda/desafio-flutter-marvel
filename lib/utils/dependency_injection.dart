import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../model/repositories/get_data_repository.dart';
import '../model/services/get_data_dio_services.dart';

final s1 = GetIt.instance;

class DependencyInjection {
  static init() {
    s1.registerSingleton<Dio>(Dio());
    s1.registerSingleton<GetDataRepository>(
        GetDataRepository(GetDataDioServices()));
  }
}
