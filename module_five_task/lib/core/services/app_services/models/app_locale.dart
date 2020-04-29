import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_locale.g.dart';

@JsonSerializable()
class AppLocale{

  String _language, _region;

  AppLocale({
    @required String language,
    @required String region
  }) : assert(language != null && region != null) {
    _language = language;
    _region = region;
  }

  String get language => _language;

  String get region => _region.toUpperCase();

  @override
  String toString() {
    return "${language}_$region";
  }

  factory AppLocale.fromJson(Map<String, dynamic> json) => _$AppLocaleFromJson(json);

  Map<String, dynamic> toJson() => _$AppLocaleToJson(this);
}