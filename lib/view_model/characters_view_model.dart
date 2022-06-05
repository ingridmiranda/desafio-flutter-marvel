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

  @observable
  ObservableList<CharactersResultsModel>? charactersList =
      ObservableList<CharactersResultsModel>();

  @observable
  var offset = 0;

  @observable
  ScrollController scrollController = ScrollController();

  @observable
  var loadingCharacters = false;

  @action
  Future getCharacters(BuildContext context) async {
    if (offset == 0) {
      charactersOptions = CharactersOption.loading;
    } else {
      loadingCharacters = true;
    }

    if (await Utils.isConnected()) {
      offset += 20;
      characters = await repository.getCharacters(offset);
      if (characters != null && characters!.results.isNotEmpty) {
        charactersList?.addAll(characters!.results);
      }
    } else {
      charactersOptions = CharactersOption.empty;
      Utils.showInternetSnackbar(context);
    }

    loadingCharacters = false;

    if (characters != null) {
      charactersOptions = CharactersOption.show;
    } else {
      charactersOptions = CharactersOption.empty;
    }
  }

  infiniteScrolling(BuildContext context) {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !loadingCharacters) {
      getCharacters(context);
    }
  }
}
