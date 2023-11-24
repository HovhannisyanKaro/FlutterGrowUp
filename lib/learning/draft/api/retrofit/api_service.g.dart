// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseBody _$ResponseBodyFromJson(Map<String, dynamic> json) => ResponseBody(
      status: json['status'] as String,
      response: json['response'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$ResponseBodyToJson(ResponseBody instance) =>
    <String, dynamic>{
      'status': instance.status,
      'response': instance.response,
    };
