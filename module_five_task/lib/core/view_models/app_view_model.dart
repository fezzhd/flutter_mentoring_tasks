import 'dart:ui';

import 'package:module_five_task/core/services/app_services/app_localization_service.dart';
import 'package:module_five_task/core/shared/disposable.dart';
import 'package:module_five_task/core/view_models/view_model_mixin.dart';
import 'package:rxdart/rxdart.dart';

class AppViewModel with ViewModelMixin implements Disposable{

  AppLocalizationService _localizationService;
  
  BehaviorSubject<Locale> localizationSubject = BehaviorSubject<Locale>();
  
  AppViewModel(){
    _localizationService = locator.get<AppLocalizationService>();
    localizationSubject.mergeWith([_localizationService.localizationChangedSubject]);
  }

  Future setCurrentLocalization() async{
    var currentLocale = await _localizationService.getCurrentLocale();
    localizationSubject.add(currentLocale);
  }

  @override
  void dispose() {
    localizationSubject.close();
  }

}