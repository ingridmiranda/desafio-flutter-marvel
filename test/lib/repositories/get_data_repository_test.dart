import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:desafio_flutter_marvel/model/components_models/components_models.dart';
import 'package:desafio_flutter_marvel/model/repositories/get_data_repository.dart';
import 'package:desafio_flutter_marvel/model/services/get_data_dio_services.dart';

class GetDataDioServicesMock extends Mock implements GetDataDioServices {}

void main() {
  final serviceMock = GetDataDioServicesMock();
  final sut = GetDataRepository(serviceMock);
  const offset = 0;

  test('Should call getDioCharacters', () async {
    when(() => serviceMock.getDioCharacters(offset))
        .thenAnswer((_) async => responseMock.data);

    await sut.getCharacters(offset);

    verify(() => serviceMock.getDioCharacters(offset));
  });

  test('Should return CharactersDataModel if requisition is valid', () async {
    when(() => serviceMock.getDioCharacters(offset))
        .thenAnswer((_) async => responseMock.data);

    var result = await sut.getCharacters(offset);

    expect(result, responseMock.data);
  });

  test('Should return Null if requisition is invalid', () async {
    when(() => serviceMock.getDioCharacters(offset))
        .thenAnswer((_) async => null);

    var result = await sut.getCharacters(offset);

    expect(result, null);
  });
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
