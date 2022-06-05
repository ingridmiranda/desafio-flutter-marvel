import 'package:desafio_flutter_marvel/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/domain.dart';
import '../../../infra/infra.dart';

part 'details_view_model.g.dart';

enum ComicsOption { empty, loading, show }

class DetailsViewModel = DetailsViewModelBase with _$DetailsViewModel;

abstract class DetailsViewModelBase with Store {
  final GetDataRepository repository;

  DetailsViewModelBase(this.repository);

  @observable
  CharactersResultsModel? character;

  @observable
  var comicsOptions = ComicsOption.empty;

  @observable
  ObservableList<ComicsResultsModel>? comicsList =
      ObservableList<ComicsResultsModel>();

  getComics(int characterId, BuildContext context) async {
    if (await Utils.isConnected()) {
      var comics = await repository.getComics(characterId);
      if (comics != null) {
        comicsList?.addAll(comics.results);
      }
    } else {
      Utils.showInternetSnackbar(context);
    }
  }

  openDetailsInfo(CharactersResultsModel? characterResults, int id,
      BuildContext context) async {
    comicsOptions = ComicsOption.loading;
    character = characterResults;
    await getComics(id, context);
    handleComicsOptions();
  }

  handleComicsOptions() {
    if (comicsList?.isNotEmpty == true) {
      comicsOptions = ComicsOption.show;
    } else {
      ComicsOption.empty;
    }
  }
}
