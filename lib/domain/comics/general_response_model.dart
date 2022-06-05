import 'package:json_annotation/json_annotation.dart';

import './comics.dart';

part 'general_response_model.g.dart';

@JsonSerializable()
class GeneralResponseModel {
  int code;
  String status;
  String attributionText;
  ComicsResponseModel data;

  GeneralResponseModel({
    required this.code,
    required this.status,
    required this.attributionText,
    required this.data,
  });

  factory GeneralResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GeneralResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$GeneralResponseModelToJson(this);
}
