import 'package:desafio_flutter_marvel/domain/domain.dart';
import 'package:desafio_flutter_marvel/external/external.dart';
import 'package:desafio_flutter_marvel/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetDataDioServicesMock extends Mock implements GetDataDioServices {}

class DioMock extends Mock implements Dio {}

void main() {
  final serviceMock = GetDataDioServicesMock();
  const offset = 0;

  test(
    'Should call getData with characters parameter if called getDioCharacters',
    () async {
      when(() => serviceMock.getData('characters', offset))
          .thenAnswer((_) async => generalResponseMock);

      final result = await serviceMock.getDioCharacters(offset);

      expect(result, generalResponseMock.data);
    },
  );

  test(
    'Should return Null if invalid data is returned from called getData',
    () async {
      when(() => serviceMock.getData('characters', offset))
          .thenAnswer((_) async => notFoundErrorResponseMock);

      final result = await serviceMock.getDioCharacters(offset);

      expect(result, null);
    },
  );

  test(
    'Should return Null if invalid data is returned from called getData',
    () async {
      when(() => serviceMock.getData('characters', offset)).thenThrow(DioError);

      final result = await serviceMock.getDioCharacters(offset);

      expect(result, null);
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

var notFoundErrorResponseMock = Response(
    statusCode: 404,
    requestOptions: RequestOptions(
        path: '${Constants.urlService}characters', data: responseMock.data));
