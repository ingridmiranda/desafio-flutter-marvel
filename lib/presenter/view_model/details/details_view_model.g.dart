// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsViewModel on DetailsViewModelBase, Store {
  late final _$characterAtom =
      Atom(name: 'DetailsViewModelBase.character', context: context);

  @override
  CharactersResultsModel? get character {
    _$characterAtom.reportRead();
    return super.character;
  }

  @override
  set character(CharactersResultsModel? value) {
    _$characterAtom.reportWrite(value, super.character, () {
      super.character = value;
    });
  }

  late final _$comicsOptionsAtom =
      Atom(name: 'DetailsViewModelBase.comicsOptions', context: context);

  @override
  ComicsOption get comicsOptions {
    _$comicsOptionsAtom.reportRead();
    return super.comicsOptions;
  }

  @override
  set comicsOptions(ComicsOption value) {
    _$comicsOptionsAtom.reportWrite(value, super.comicsOptions, () {
      super.comicsOptions = value;
    });
  }

  late final _$comicsListAtom =
      Atom(name: 'DetailsViewModelBase.comicsList', context: context);

  @override
  ObservableList<ComicsResultsModel>? get comicsList {
    _$comicsListAtom.reportRead();
    return super.comicsList;
  }

  @override
  set comicsList(ObservableList<ComicsResultsModel>? value) {
    _$comicsListAtom.reportWrite(value, super.comicsList, () {
      super.comicsList = value;
    });
  }

  @override
  String toString() {
    return '''
character: ${character},
comicsOptions: ${comicsOptions},
comicsList: ${comicsList}
    ''';
  }
}
