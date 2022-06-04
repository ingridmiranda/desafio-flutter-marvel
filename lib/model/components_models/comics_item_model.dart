import 'package:json_annotation/json_annotation.dart';

part 'comics_item_model.g.dart';

@JsonSerializable()
class ComicsItemModel {
  String resourceURI;
  String name;

  ComicsItemModel({
    required this.resourceURI,
    required this.name,
  });

  factory ComicsItemModel.fromJson(Map<String, dynamic> json) =>
      _$ComicsItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComicsItemModelToJson(this);
}
