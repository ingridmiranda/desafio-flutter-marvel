import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:desafio_flutter_marvel/domain/characters/characters.dart';
import 'package:desafio_flutter_marvel/domain/comics/comics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

import 'package:desafio_flutter_marvel/external/external.dart';
import 'package:desafio_flutter_marvel/infra/infra.dart';
import 'package:desafio_flutter_marvel/presenter/ui/pages/details_page/details_page.dart';
import 'package:desafio_flutter_marvel/presenter/view_model/details/details_view_model.dart';

void main() {
  final s1 = GetIt.instance;
  late DetailsViewModel controller;

  s1.registerSingleton<GetDataDioServices>(GetDataDioServices());
  s1.registerSingleton<GetDataRepository>(
      GetDataRepository(GetDataDioServices()));
  s1.registerSingleton<DetailsViewModel>(
      DetailsViewModel(GetDataRepository(GetDataDioServices())));

  Future<void> loadPage(WidgetTester tester) async {
    const detailsPage = MaterialApp(home: DetailsPage());

    controller.character = charactersMock;
    controller.comicsList!.addAll(comicsMock);

    await tester.pumpWidget(detailsPage);
  }

  setUp(() {
    controller = s1.get<DetailsViewModel>();
    HttpOverrides.global = null;
  });

  testWidgets(
      'Should show CircularProgressIndicator if ComicsOptions is loading',
      (tester) async {
    await loadPage(tester);

    controller.comicsOptions = ComicsOption.loading;
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('Should show default description if Character does not have one',
      (tester) async {
    await loadPage(tester);

    controller.character?.description = '';
    await tester.pump();

    expect(
        find.textContaining('No more information was founded'), findsOneWidget);
  });

  testWidgets('Should show specific text if ComicsOptions is empty',
      (tester) async {
    await loadPage(tester);

    controller.comicsOptions = ComicsOption.empty;
    await tester.pump();

    expect(find.textContaining('Oops, no comic was found to this character'),
        findsOneWidget);
  });

  testWidgets('Should show Carousel with Comics if ComicsOptions is show',
      (tester) async {
    await loadPage(tester);

    controller.comicsOptions = ComicsOption.show;
    await tester.pump();

    expect(find.bySubtype<CarouselSlider>(), findsOneWidget);
  });
}

final charactersMock = CharactersResultsModel(
    id: 1011334,
    name: "3-D Man",
    description: "",
    thumbnail: ThumbnailModel(
        extension: "jpg",
        path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784"),
    comics: ComicsDataModel(available: 1, items: [
      ComicsItemModel(
          resourceURI: "http://gateway.marvel.com/v1/public/comics/21366",
          name: "Avengers: The Initiative (2007) #14")
    ]));

final comicsMock = [
  ComicsResultsModel(
    id: 22506,
    title: "Avengers: The Initiative (2007) #19",
    thumbnail: ComicsThumbnailModel(
        extension: "jpg",
        path: "http://i.annihil.us/u/prod/marvel/i/mg/d/03/58dd080719806"),
  )
];
