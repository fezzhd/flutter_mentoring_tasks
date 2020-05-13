import 'dart:ui';
import 'package:module_five_task/core/services/app_services/app_localization_service.dart';
import 'package:module_five_task/core/shared/disposable.dart';
import 'package:module_five_task/core/view_models/view_model_mixin.dart';

class AppViewModel with ViewModelMixin implements Disposable{

  AppLocalizationService _localizationService;
  
  Stream<Locale> localizationStream;
  
  AppViewModel(){
    _localizationService = locator.get<AppLocalizationService>();
    localizationStream = _localizationService.localizationChangedSubject.asBroadcastStream();
  }

  Future<Locale> getCurrentLocale() async{
   return await _localizationService.getCurrentLocale();
  }

  @override
  void dispose() {
   localizationStream = null;
  }

}