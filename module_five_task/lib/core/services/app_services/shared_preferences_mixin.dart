import 'package:shared_preferences/shared_preferences.dart';

mixin SharedPreferencesMixin{

  Future<SharedPreferences> getSharedInstanceAsync() => SharedPreferences.getInstance();
}