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
characters: ${characters}
    ''';
  }
}
