import 'package:desafio_flutter_marvel/model/components_models/components_models.dart';
import 'package:desafio_flutter_marvel/model/services/get_data_dio_services.dart';
import 'package:desafio_flutter_marvel/utils/util.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetDataDioServicesMock extends Mock implements GetDataDioServices {}

class DioMock extends Mock implements Dio {}

void main() {
  final serviceMock = GetDataDioServicesMock();

  test(
    'Should call getData with characters parameter if called getDioCharacters',
    () async {
      when(() => serviceMock.getData('characters'))
          .thenAnswer((_) async => generalResponseMock);

      final result = await serviceMock.getDioCharacters();

      expect(result, generalResponseMock.data);
    },
  );
}

var responseMock = ResponseModel(
    code: 200,
    status: 'ok',
    attributionText: '',
    data: CharactersDataModel(limit: 1, results: [
      CharactersResultsModel(
          id: 1011334,
          name: "3-D Man",
          description: "",
          thumbnail: ThumbnailModel(
              extension: "jpg",
              path:
                  "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"),
          comics: ComicsDataModel(available: 1, items: [
            ComicsItemModel(
                resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
                name: "Avengers: The Initiative (2007) #14")
          ]))
    ]));

var generalResponseMock = Response(
    requestOptions: RequestOptions(
        path: '${Constants.urlService}characters', data: responseMock.data));
