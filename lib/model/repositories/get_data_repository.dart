import '../components_models/components_models.dart';
import '../services/get_data_dio_services.dart';

class GetDataRepository {
  final dioServices = GetDataDioServices();

  Future<CharactersDataModel?> getCharacters() async {
    return await dioServices.getDioCharacters();
  }
}