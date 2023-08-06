import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys{
  userid
}
class SharedPref{
  // THIS IS SINGLETON CLASS
  SharedPref._();
  static final SharedPref _instance =SharedPref._();
  late SharedPreferences _sharedPreferences;
  factory SharedPref(){
    return _instance;
  }
  Future<void> initPref()async{
    _sharedPreferences = await SharedPreferences.getInstance();
  }

   Future<void> save({required String uid})async{
    _sharedPreferences.setString(PrefKeys.userid.toString(), uid);
  }

  String get userID => _sharedPreferences.getString(PrefKeys.userid.toString()) ?? "Not Found";

}