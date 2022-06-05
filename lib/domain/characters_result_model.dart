import 'package:json_annotation/json_annotation.dart';

import 'domain.dart';

part 'characters_result_model.g.dart';

@JsonSerializable()
class CharactersResultsModel {
  int id;
  String name;
  String description;
  ThumbnailModel thumbnail;
  ComicsDataModel comics;

  CharactersResultsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.comics,
  });

  factory CharactersResultsModel.fromJson(Map<String, dynamic> json) =>
      _$CharactersResultsModelFromJson(json);
  Map<String, dynamic> toJson() => _$CharactersResultsModelToJson(this);
}
