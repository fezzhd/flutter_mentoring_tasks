import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:module_five_task/core/services/app_services/app_localization_service.dart';
import 'package:module_five_task/core/shared/disposable.dart';
import 'package:module_five_task/core/view_models/view_model_mixin.dart';
import 'package:module_five_task/generated/l10n.dart';

class SettingsViewModel with ViewModelMixin implements Disposable{

  AppLocalizationService _appLocalizationService;

  PublishSubject<Locale> _languageSettingsChangedSubject = PublishSubject<Locale>();

  Stream<Locale> languageSettingsChangedSubject;

  SettingsViewModel(){
    _appLocalizationService = locator.get<AppLocalizationService>();
    languageSettingsChangedSubject = _languageSettingsChangedSubject.mergeWith([_appLocalizationService.localizationChangedSubject, _appLocalizationService.getCurrentLocale().asStream()]).asBroadcastStream();
  }

  List<Locale> get localeList => AppLocalization.delegate.supportedLocales;

  Future selectLocale(Locale localeValue) async {
    await _appLocalizationService.changeLocaleAsync(localeValue);
  }

  @override
  void dispose() {
    _languageSettingsChangedSubject.close();
  }
}