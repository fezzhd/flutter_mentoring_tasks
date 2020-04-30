import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:module_five_task/core/services/app_services/models/app_locale.dart';
import 'package:module_five_task/core/services/app_services/shared_preferences_mixin.dart';
import 'package:module_five_task/generated/l10n.dart';

class AppLocalizationService with SharedPreferencesMixin{

  static String _localizationKey = "locale";

  final PublishSubject<Locale> localizationChangedSubject = PublishSubject<Locale>();

  Future changeLocaleAsync(Locale locale) async {
    assert(locale != null);
    await AppLocalization.load(locale);
    var appLocaleJsonMap = AppLocale(language: locale.languageCode, region: locale.countryCode).toJson();
    var pref = await getSharedInstanceAsync();
    pref.setString(_localizationKey, json.encode(appLocaleJsonMap));
    localizationChangedSubject.add(locale);
  }

  Future<Locale> getCurrentLocale() async{
    Locale currentLocale = AppLocalization.delegate.supportedLocales.first;
    var pref = await getSharedInstanceAsync();
    var appLocaleJsonString = pref.getString(_localizationKey);
    if (appLocaleJsonString != null) {
      var appLocale = AppLocale.fromJson(json.decode(appLocaleJsonString));
      currentLocale = Locale(appLocale.language, appLocale.region);
    }

    return currentLocale;
  }
}