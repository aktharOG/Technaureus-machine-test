// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryListModel _$CountryListModelFromJson(Map<String, dynamic> json) =>
    CountryListModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$CountryListModelToJson(CountryListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };
