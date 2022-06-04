import 'package:flutter_test/flutter_test.dart';

import 'package:desafio_flutter_marvel/model/repositories/get_data_repository.dart';

void main() {
  late GetDataRepository sut;

  setUp(
    () {
      sut = GetDataRepository();
    },
  );

  test('Should receive CharactersDataModel', () async {
    var response = await sut.getCharacters();

    expect(response, isNotNull);
    expect(response?.results.isNotEmpty, equals(true));
  });
}
