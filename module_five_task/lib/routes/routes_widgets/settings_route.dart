import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:module_five_task/core/view_models/settings_view_model.dart';
import 'package:module_five_task/generated/l10n.dart';

class SettingsRoute extends StatefulWidget{

  @override
  _SettingsRouteState createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {
  Locale _groupedLocale;

  final GetIt locator = GetIt.instance;
  SettingsViewModel _settingsViewModel;

  @override
  void initState() {
    super.initState();
    _settingsViewModel = locator.get<SettingsViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalization.of(context).selectLanguage)),
      body: SafeArea(
        child: StreamBuilder<Locale>(
          stream: _settingsViewModel.languageSettingsChangedSubject,
          builder: (context, snapshot) {
            if (snapshot.hasData){
              _groupedLocale = snapshot.data;
              return ListView.builder(
                itemCount: _settingsViewModel.localeList.length,
                itemBuilder: (buildContext, index) =>
                  RadioListTile(
                    groupValue: _groupedLocale,
                    value: _settingsViewModel.localeList[index],
                    onChanged: _radioButtonSelected,
                    title: Text(_getItemText(_settingsViewModel.localeList[index], context)),
                  )
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
        )
      )
    );
  }

  String _getItemText(Locale locale, BuildContext context){
    switch(locale.languageCode){
      case "ru":
        return AppLocalization.of(context).russianLanguage;
      case "en":
        return AppLocalization.of(context).englishLanguage;
      default:
        throw UnimplementedError("Language ${locale.languageCode} doesn't support");
    }
  }

  void _radioButtonSelected(Locale value){
    _settingsViewModel.selectLocale(value);
  }
}