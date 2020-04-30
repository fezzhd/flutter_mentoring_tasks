import 'dart:ui';

import 'package:module_five_task/core/services/app_services/app_localization_service.dart';
import 'package:module_five_task/core/shared/disposable.dart';
import 'package:module_five_task/core/view_models/view_model_mixin.dart';
import 'package:rxdart/rxdart.dart';

class AppViewModel with ViewModelMixin implements Disposable{

  AppLocalizationService _localizationService;
  
  BehaviorSubject<Locale> _localizationSubject = BehaviorSubject<Locale>();

  Stream<Locale> localizationStream;
  
  AppViewModel(){
    _localizationService = locator.get<AppLocalizationService>();
    localizationStream = _localizationSubject.mergeWith([_localizationService.localizationChangedSubject, _localizationService.getCurrentLocale().asStream()]).asBroadcastStream();
  }

  Future setCurrentLocalization() async{
    var currentLocale = await _localizationService.getCurrentLocale();
    _localizationSubject.add(currentLocale);
  }

  @override
  void dispose() {
    _localizationSubject.close();
  }

}