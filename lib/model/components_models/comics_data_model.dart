import 'package:json_annotation/json_annotation.dart';

import 'components_models.dart';

part 'comics_data_model.g.dart';

@JsonSerializable()
class ComicsDataModel {
  int available;
  List<ComicsItemModel> items;

  ComicsDataModel({
    required this.available,
    required this.items,
  });

  factory ComicsDataModel.fromJson(Map<String, dynamic> json) =>
      _$ComicsDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$ComicsDataModelToJson(this);
}
