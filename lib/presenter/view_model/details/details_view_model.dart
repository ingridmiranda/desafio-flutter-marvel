import 'package:mobx/mobx.dart';

import '../../../domain/domain.dart';

part 'details_view_model.g.dart';

class DetailsViewModel = DetailsViewModelBase with _$DetailsViewModel;

abstract class DetailsViewModelBase with Store {
  @observable
  CharactersResultsModel? character;
}
