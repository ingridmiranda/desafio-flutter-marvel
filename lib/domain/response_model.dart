import 'package:json_annotation/json_annotation.dart';

import 'domain.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel {
  int code;
  String status;
  String attributionText;
  CharactersDataModel data;

  ResponseModel({
    required this.code,
    required this.status,
    required this.attributionText,
    required this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);
}
