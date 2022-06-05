import 'package:dio/dio.dart';

import '../../utils/util.dart';
import '../components_models/components_models.dart';

class GetDataDioServices {
  Future<Response<dynamic>?> getData(String parameter, int? offset) async {
    Response<dynamic>? response;
    try {
      final ts = DateTime.now().millisecondsSinceEpoch.toString();
      final hash = Utils.textToMd5(ts + Keys.privateKey + Keys.apiKey);
      response = await Dio().get('${Constants.urlService}$parameter',
          queryParameters: {
            'offset': offset,
            'ts': ts,
            'apikey': Keys.apiKey,
            'hash': hash
          });
    } on DioError catch (error) {
      Utils.handlingExceptions(error.response?.statusCode);
    }
    return response;
  }

  Future<CharactersDataModel?>? getDioCharacters(int? offset) async {
    var response = await getData('characters', offset);
    if (response != null) {
      return ResponseModel.fromJson(response.data).data;
    }
    return null;
  }
}
