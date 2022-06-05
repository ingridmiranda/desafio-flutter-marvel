// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel _$ResponseModelFromJson(Map<String, dynamic> json) =>
    ResponseModel(
      code: json['code'] as int,
      status: json['status'] as String,
      attributionText: json['attributionText'] as String,
      data: CharactersDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ResponseModelToJson(ResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'attributionText': instance.attributionText,
      'data': instance.data,
    };
