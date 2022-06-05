import 'package:desafio_flutter_marvel/presenter/view_model/characters/characters_view_model.dart';
import 'package:desafio_flutter_marvel/presenter/view_model/details/details_view_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../external/external.dart';
import '../infra/infra.dart';

final s1 = GetIt.instance;

class DependencyInjection {
  static init() {
    s1.registerSingleton<Dio>(Dio());
    s1.registerSingleton<GetDataDioServices>(GetDataDioServices());
    s1.registerSingleton<GetDataRepository>(
        GetDataRepository(GetDataDioServices()));
    s1.registerSingleton<CharactersViewModel>(CharactersViewModel(
        repository: GetDataRepository(GetDataDioServices())));
    s1.registerSingleton<DetailsViewModel>(
        DetailsViewModel(GetDataRepository(GetDataDioServices())));
  }
}
