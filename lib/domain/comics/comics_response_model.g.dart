// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicsResponseModel _$ComicsResponseModelFromJson(Map<String, dynamic> json) =>
    ComicsResponseModel(
      total: json['total'] as int?,
      results: (json['results'] as List<dynamic>)
          .map((e) => ComicsResultsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ComicsResponseModelToJson(
        ComicsResponseModel instance) =>
    <String, dynamic>{
      'total': instance.total,
      'results': instance.results,
    };
