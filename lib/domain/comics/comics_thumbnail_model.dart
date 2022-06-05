import 'package:json_annotation/json_annotation.dart';

part 'comics_thumbnail_model.g.dart';

@JsonSerializable()
class ComicsThumbnailModel {
  String path;
  String extension;

  ComicsThumbnailModel({
    required this.path,
    required this.extension,
  });

  factory ComicsThumbnailModel.fromJson(Map<String, dynamic> json) =>
      _$ComicsThumbnailModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComicsThumbnailModelToJson(this);
}
