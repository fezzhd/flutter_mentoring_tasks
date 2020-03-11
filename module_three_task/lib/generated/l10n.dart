// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class AppLocalization {
  AppLocalization(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<AppLocalization> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalization(localeName);
    });
  } 

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  final String localeName;

  String get pressMe {
    return Intl.message(
      'Press me',
      name: 'pressMe',
      desc: '',
      args: [],
    );
  }

  String get firstRouteTitle {
    return Intl.message(
      'First route',
      name: 'firstRouteTitle',
      desc: '',
      args: [],
    );
  }

  String get secondRouteTitle {
    return Intl.message(
      'Second route',
      name: 'secondRouteTitle',
      desc: '',
      args: [],
    );
  }

  String returnButton(dynamic value) {
    return Intl.message(
      'Return $value',
      name: 'returnButton',
      desc: '',
      args: [value],
    );
  }

  String resultIs(dynamic value) {
    return Intl.message(
      'Result is $value',
      name: 'resultIs',
      desc: '',
      args: [value],
    );
  }

  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  String get exitConfirmationTitle {
    return Intl.message(
      'Exit',
      name: 'exitConfirmationTitle',
      desc: '',
      args: [],
    );
  }

  String get exitConfirmationContent {
    return Intl.message(
      'Are you sure ?',
      name: 'exitConfirmationContent',
      desc: '',
      args: [],
    );
  }

  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('en', 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}