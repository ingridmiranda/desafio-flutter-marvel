// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicsResultsModel _$ComicsResultsModelFromJson(Map<String, dynamic> json) =>
    ComicsResultsModel(
      id: json['id'] as int?,
      title: json['title'] as String,
      thumbnail: ComicsThumbnailModel.fromJson(
          json['thumbnail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ComicsResultsModelToJson(ComicsResultsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
    };
