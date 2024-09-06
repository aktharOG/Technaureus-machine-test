// To parse this JSON data, do
//
//     final countryListModel = countryListModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'country_list_model.g.dart';

List<CountryListModel> countryListModelFromJson(String str) =>
    List<CountryListModel>.from(
      json.decode(str).map((x) => CountryListModel.fromJson(x)),
    );

String countryListModelToJson(List<CountryListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class CountryListModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "code")
  final String? code;

  CountryListModel({
    this.id,
    this.name,
    this.code,
  });

  CountryListModel copyWith({
    int? id,
    String? name,
    String? code,
  }) =>
      CountryListModel(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
      );

  factory CountryListModel.fromJson(Map<String, dynamic> json) =>
      _$CountryListModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountryListModelToJson(this);
}
