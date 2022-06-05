import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/domain.dart';
import '../../../infra/infra.dart';
import '../../../utils/utils.dart';

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
      characters = await repository.getCharacters(offset);
      offset += 20;
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
