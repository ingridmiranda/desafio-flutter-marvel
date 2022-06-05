// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicsDataModel _$ComicsDataModelFromJson(Map<String, dynamic> json) =>
    ComicsDataModel(
      available: json['available'] as int,
      items: (json['items'] as List<dynamic>)
          .map((e) => ComicsItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicsDataModelToJson(ComicsDataModel instance) =>
    <String, dynamic>{
      'available': instance.available,
      'items': instance.items,
    };
