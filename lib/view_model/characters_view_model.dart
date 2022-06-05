import 'package:desafio_flutter_marvel/model/components_models/components_models.dart';
import 'package:desafio_flutter_marvel/model/repositories/get_data_repository.dart';
import 'package:desafio_flutter_marvel/utils/util.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'characters_view_model.g.dart';

enum CharactersOption { empty, loading, show }

class CharactersViewModel = CharactersViewModelBase with _$CharactersViewModel;

abstract class CharactersViewModelBase with Store {
  final GetDataRepository repository;

  CharactersViewModelBase({required this.repository});

  @observable
  var charactersOptions = CharactersOption.empty;

  @observable
  CharactersDataModel? characters;

  @action
  Future getCharacters(BuildContext context) async {
    charactersOptions = CharactersOption.loading;

    if (await Utils.isConnected()) {
      characters = await repository.getCharacters();
    } else {
      charactersOptions = CharactersOption.empty;
      Utils.showInternetSnackbar(context);
    }

    if (characters != null) {
      charactersOptions = CharactersOption.show;
    } else {
      charactersOptions = CharactersOption.empty;
    }
  }
}
