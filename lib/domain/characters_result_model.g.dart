// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'characters_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharactersResultsModel _$CharactersResultsModelFromJson(
        Map<String, dynamic> json) =>
    CharactersResultsModel(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      thumbnail:
          ThumbnailModel.fromJson(json['thumbnail'] as Map<String, dynamic>),
      comics: ComicsDataModel.fromJson(json['comics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CharactersResultsModelToJson(
        CharactersResultsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'comics': instance.comics,
    };
