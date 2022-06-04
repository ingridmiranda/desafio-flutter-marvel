import 'package:desafio_flutter_marvel/model/components_models/components_models.dart';
import 'package:dio/dio.dart';

import '../../utils/util.dart';

class GetDataDioServices {
  Future<Response<dynamic>?>? getData(String parameter) async {
    try {
      final ts = DateTime.now().millisecondsSinceEpoch.toString();
      final hash = Utils.textToMd5(ts + Keys.privateKey + Keys.apiKey);
      var response = await Dio().get('${Constants.urlService}$parameter',
          queryParameters: {'ts': ts, 'apikey': Keys.apiKey, 'hash': hash});
      return response;
    } on DioError {
      return null;
    }
  }

  Future<CharactersDataModel?>? getDioCharacters() async {
    var response = await getData('characters');
    if (response != null) {
      return ResponseModel.fromJson(response.data).data;
    }
    return null;
  }
}
