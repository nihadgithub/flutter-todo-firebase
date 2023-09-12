import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? prefs;
Future<void> createPrefs()async{
  prefs = await SharedPreferences.getInstance();

}
bool getStatus() {
  return prefs!.getBool('loggedIn')?? false;

}
Future<void> setStatus() async{
  await prefs!.setBool('loggedIn', true);
}
