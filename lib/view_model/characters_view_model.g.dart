// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CharactersViewModel on CharactersViewModelBase, Store {
  late final _$charactersOptionsAtom =
      Atom(name: 'CharactersViewModelBase.charactersOptions', context: context);

  @override
  CharactersOption get charactersOptions {
    _$charactersOptionsAtom.reportRead();
    return super.charactersOptions;
  }

  @override
  set charactersOptions(CharactersOption value) {
    _$charactersOptionsAtom.reportWrite(value, super.charactersOptions, () {
      super.charactersOptions = value;
    });
  }

  late final _$charactersAtom =
      Atom(name: 'CharactersViewModelBase.characters', context: context);

  @override
  CharactersDataModel? get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(CharactersDataModel? value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$charactersListAtom =
      Atom(name: 'CharactersViewModelBase.charactersList', context: context);

  @override
  ObservableList<CharactersResultsModel>? get charactersList {
    _$charactersListAtom.reportRead();
    return super.charactersList;
  }

  @override
  set charactersList(ObservableList<CharactersResultsModel>? value) {
    _$charactersListAtom.reportWrite(value, super.charactersList, () {
      super.charactersList = value;
    });
  }

  late final _$offsetAtom =
      Atom(name: 'CharactersViewModelBase.offset', context: context);

  @override
  int get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(int value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  late final _$scrollControllerAtom =
      Atom(name: 'CharactersViewModelBase.scrollController', context: context);

  @override
  ScrollController get scrollController {
    _$scrollControllerAtom.reportRead();
    return super.scrollController;
  }

  @override
  set scrollController(ScrollController value) {
    _$scrollControllerAtom.reportWrite(value, super.scrollController, () {
      super.scrollController = value;
    });
  }

  late final _$loadingCharactersAtom =
      Atom(name: 'CharactersViewModelBase.loadingCharacters', context: context);

  @override
  bool get loadingCharacters {
    _$loadingCharactersAtom.reportRead();
    return super.loadingCharacters;
  }

  @override
  set loadingCharacters(bool value) {
    _$loadingCharactersAtom.reportWrite(value, super.loadingCharacters, () {
      super.loadingCharacters = value;
    });
  }

  late final _$getCharactersAsyncAction =
      AsyncAction('CharactersViewModelBase.getCharacters', context: context);

  @override
  Future<dynamic> getCharacters(BuildContext context) {
    return _$getCharactersAsyncAction.run(() => super.getCharacters(context));
  }

  @override
  String toString() {
    return '''
charactersOptions: ${charactersOptions},
characters: ${characters},
charactersList: ${charactersList},
offset: ${offset},
scrollController: ${scrollController},
loadingCharacters: ${loadingCharacters}
    ''';
  }
}
