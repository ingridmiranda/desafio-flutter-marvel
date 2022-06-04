// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersDataModel _$CharactersDataModelFromJson(Map<String, dynamic> json) =>
    CharactersDataModel(
      limit: json['limit'] as int,
      results: (json['results'] as List<dynamic>)
          .map(
              (e) => CharactersResultsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharactersDataModelToJson(
        CharactersDataModel instance) =>
    <String, dynamic>{
      'limit': instance.limit,
      'results': instance.results,
    };
