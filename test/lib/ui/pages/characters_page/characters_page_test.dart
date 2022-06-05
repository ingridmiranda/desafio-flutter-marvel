import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:desafio_flutter_marvel/external/external.dart';
import 'package:desafio_flutter_marvel/infra/infra.dart';
import 'package:desafio_flutter_marvel/presenter/view_model/characters/characters_view_model.dart';
import 'package:desafio_flutter_marvel/presenter/ui/pages/characters_page/characters_page.dart';

void main() {
  final s1 = GetIt.instance;
  late CharactersViewModel controller;

  s1.registerSingleton<GetDataDioServices>(GetDataDioServices());
  s1.registerSingleton<GetDataRepository>(
      GetDataRepository(GetDataDioServices()));
  s1.registerSingleton<CharactersViewModel>(
      CharactersViewModel(repository: GetDataRepository(GetDataDioServices())));

  Future<void> loadPage(WidgetTester tester) async {
    const charactersPage = MaterialApp(home: CharactersPage());

    await tester.pumpWidget(charactersPage);
  }

  setUp(() {
    controller = s1.get<CharactersViewModel>();
  });

  testWidgets(
      'Should show CircularProgressIndicator if CharactersOptions is loading',
      (tester) async {
    await loadPage(tester);

    controller.charactersOptions = CharactersOption.loading;
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Should show not found text if CharactersOptions is empty',
      (tester) async {
    await loadPage(tester);

    controller.charactersOptions = CharactersOption.empty;
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.textContaining('Oops, no characters were found yet'),
        findsOneWidget);
  });

  testWidgets('Should show List with characters if CharactersOptions is show',
      (tester) async {
    await loadPage(tester);

    controller.charactersOptions = CharactersOption.show;
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.textContaining('Oops, no characters were found yet'),
        findsNothing);
    expect(find.bySubtype<ListView>(), findsOneWidget);
  });
}
