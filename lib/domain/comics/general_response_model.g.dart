// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralResponseModel _$GeneralResponseModelFromJson(
        Map<String, dynamic> json) =>
    GeneralResponseModel(
      code: json['code'] as int,
      status: json['status'] as String,
      attributionText: json['attributionText'] as String,
      data: ComicsResponseModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeneralResponseModelToJson(
        GeneralResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'attributionText': instance.attributionText,
      'data': instance.data,
    };
