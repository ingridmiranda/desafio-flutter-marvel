import 'package:json_annotation/json_annotation.dart';

part 'thumbnail_model.g.dart';

@JsonSerializable()
class ThumbnailModel {
  String path;
  String extension;

  ThumbnailModel({
    required this.path,
    required this.extension,
  });

  factory ThumbnailModel.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailModelFromJson(json);
  Map<String, dynamic> toJson() => _$ThumbnailModelToJson(this);
}
