import 'package:json_annotation/json_annotation.dart';

import 'components_models.dart';

part 'characters_data_model.g.dart';

@JsonSerializable()
class CharactersDataModel {
  int limit;
  List<CharactersResultsModel> results;

  CharactersDataModel({
    required this.limit,
    required this.results,
  });

  factory CharactersDataModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersDataModelToJson(this);
}
