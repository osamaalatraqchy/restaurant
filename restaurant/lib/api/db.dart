import 'package:shared_preferences/shared_preferences.dart';

class Db {
  setPos(String value)async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('pos', value);
  }

  getPos()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String pos = pref.getString('pos');
    return pos;
  }
}