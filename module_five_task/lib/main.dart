import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:module_five_task/core/services/app_services/app_localization_service.dart';
import 'package:module_five_task/core/services/app_services/navigation_service.dart';
import 'package:module_five_task/core/services/posts/post_service.dart';
import 'package:module_five_task/core/view_models/app_view_model.dart';
import 'package:module_five_task/core/view_models/post_list_view_model.dart';
import 'package:module_five_task/core/view_models/post_view_model.dart';
import 'package:module_five_task/routes/routes_widgets/post_list_route.dart';
import 'package:module_five_task/routes/routes_widgets/post_route.dart';
import 'core/consts/routes_paths.dart' as RoutesPaths;
import 'generated/l10n.dart';

GetIt getIt = GetIt.instance;
AppViewModel _appViewModel;

Future main() async{
  _initializeBootstrapper();
  WidgetsFlutterBinding.ensureInitialized();
  _appViewModel = getIt.get<AppViewModel>();
  await _appViewModel.setCurrentLocalization();
  runApp(MyApp());
}

void _initializeBootstrapper(){
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
  getIt.registerLazySingleton<AppLocalizationService>(() => AppLocalizationService());
  getIt.registerLazySingleton<PostService>(() => PostService());

  getIt.registerFactory<AppViewModel>(() => AppViewModel());
  getIt.registerFactory<PostViewModel>(() => PostViewModel());
  getIt.registerFactory<PostListViewModel>(() => PostListViewModel());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void dispose() {
    _appViewModel.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: _appViewModel.localizationSubject,
      builder: (context, snapshot) {
        return MaterialApp(
          localizationsDelegates: [
            AppLocalization.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalMaterialLocalizations.delegate
          ],
          supportedLocales: AppLocalization.delegate.supportedLocales,
          locale: snapshot.data,
          theme: ThemeData(
            primarySwatch: Colors.red,
            primaryTextTheme: TextTheme(
              button: TextStyle(
                color: Colors.black
              ),
              bodyText1: TextStyle(
                color: Colors.black
              )
            )
          ),
          navigatorKey: getIt.get<NavigationService>().navigatorKey,
          initialRoute: RoutesPaths.postRoute,
          onGenerateRoute: _generateRoutes,
        );
      }
    );
  }

 Route<dynamic> _generateRoutes(RouteSettings settings){
    switch(settings.name){
      case RoutesPaths.postRoute:
        return MaterialPageRoute(builder: (_) => PostRoute());
      case RoutesPaths.listPostRoute:
        return MaterialPageRoute(builder: (_) => PostListRoute());
      default:
        return null;
    }
  }
}
