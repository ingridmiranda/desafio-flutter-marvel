import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../external/external.dart';
import '../infra/infra.dart';

final s1 = GetIt.instance;

class DependencyInjection {
  static init() {
    s1.registerSingleton<Dio>(Dio());
    s1.registerSingleton<GetDataRepository>(
        GetDataRepository(GetDataDioServices()));
  }
}
