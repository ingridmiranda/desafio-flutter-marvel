import 'package:desafio_flutter_marvel/domain/domain.dart';
import 'package:desafio_flutter_marvel/external/external.dart';
import 'package:desafio_flutter_marvel/infra/infra.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class GetDataDioServicesMock extends Mock implements GetDataDioServices {}

void main() {
  final serviceMock = GetDataDioServicesMock();
  final sut = GetDataRepository(serviceMock);
  const offset = 0;
  var id = faker.randomGenerator.integer(1000);

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

  test('Should call getComics', () async {
    when(() => serviceMock.getDioComics(id))
        .thenAnswer((_) async => responseComicsMock.data);

    await sut.getComics(id);

    verify(() => serviceMock.getDioComics(id));
  });

  test('Should return ComicsResponseModel if requisition is valid', () async {
    when(() => serviceMock.getDioComics(id))
        .thenAnswer((_) async => responseComicsMock.data);

    var result = await sut.getComics(id);

    expect(result, responseComicsMock.data);
  });

  test('Should return Null if Comics requisition is invalid', () async {
    when(() => serviceMock.getDioComics(id)).thenAnswer((_) async => null);

    var result = await sut.getComics(id);

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

var responseComicsMock = GeneralResponseModel(
    code: 200,
    status: 'ok',
    attributionText: '',
    data: ComicsResponseModel(total: 1, results: [
      ComicsResultsModel(
        id: 22506,
        title: "Avengers: The Initiative (2007) #19",
        thumbnail: ComicsThumbnailModel(
            extension: "jpg",
            path: "http://i.annihil.us/u/prod/marvel/i/mg/d/03/58dd080719806"),
      )
    ]));
