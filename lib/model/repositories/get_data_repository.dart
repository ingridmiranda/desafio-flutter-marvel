import '../components_models/components_models.dart';
import '../services/get_data_dio_services.dart';

class GetDataRepository {
  final GetDataDioServices dioServices;

  GetDataRepository(this.dioServices);

  Future<CharactersDataModel?> getCharacters(int offset) async {
    return await dioServices.getDioCharacters(offset);
  }
}
