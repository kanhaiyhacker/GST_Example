// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gst_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GSTDetailResponse _$GSTDetailResponseFromJson(Map<String, dynamic> json) =>
    GSTDetailResponse(
      json['name'] as String?,
      json['status'] as String?,
      json['address'] as String?,
      json['additionalPlace'] as String?,
      json['taxPayerType'] as String?,
      json['businessType'] as String?,
      json['registrationDate'] as String?,
      json['stateJurisdiction'] as String?,
      json['gstNumber'] as String?,
      json['centralJurisdiction'] as String?,
    );

Map<String, dynamic> _$GSTDetailResponseToJson(GSTDetailResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'status': instance.status,
      'address': instance.address,
      'additionalPlace': instance.additionalPlace,
      'taxPayerType': instance.taxPayerType,
      'businessType': instance.businessType,
      'registrationDate': instance.registrationDate,
      'stateJurisdiction': instance.stateJurisdiction,
      'centralJurisdiction': instance.centralJurisdiction,
      'gstNumber': instance.gstNumber,
    };
