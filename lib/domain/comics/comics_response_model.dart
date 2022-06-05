import 'package:json_annotation/json_annotation.dart';

import './comics.dart';

part 'comics_response_model.g.dart';

@JsonSerializable()
class ComicsResponseModel {
  int? total;
  List<ComicsResultsModel> results;

  ComicsResponseModel({
    required this.total,
    required this.results,
  });

  factory ComicsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ComicsResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComicsResponseModelToJson(this);
}
