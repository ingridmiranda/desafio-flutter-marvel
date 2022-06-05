import 'package:json_annotation/json_annotation.dart';

import './comics.dart';

part 'comics_result_model.g.dart';

@JsonSerializable()
class ComicsResultsModel {
  int? id;
  String title;
  ComicsThumbnailModel thumbnail;

  ComicsResultsModel({
    required this.id,
    required this.title,
    required this.thumbnail,
  });

  factory ComicsResultsModel.fromJson(Map<String, dynamic> json) =>
      _$ComicsResultsModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComicsResultsModelToJson(this);
}
