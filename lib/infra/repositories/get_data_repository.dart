import '../../domain/domain.dart';
import '../../external/external.dart';

class GetDataRepository {
  final GetDataDioServices dioServices;

  GetDataRepository(this.dioServices);

  Future<CharactersDataModel?> getCharacters(int offset) async {
    return await dioServices.getDioCharacters(offset);
  }
}
