


import 'package:shared_preferences/shared_preferences.dart';

class PrefData {
  static String keyCart = 'cardList';
  static String fevCart = 'favList';
  static String isIntro = 'intro';
  static String isLoc = 'Location';
  static String isLogin = 'login';
  static String isInfo = 'info';
  static String isNotify = 'notification';
  static String darkMode = 'darkMode';

  static Future<List<String>> getCartList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    return prefs.getStringList(keyCart) ?? [];
    // return  await prefs.getString('name')??'';
  }

  static setCartList(List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(keyCart, value);
  }

  static Future<List<String>> getFevList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    // return json.decode(prefs.getString(fevCart)!);
    return prefs.getStringList(fevCart) ?? [];
  }

  static setFevList(List<String> value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(fevCart, value);
  }

  static setIntro(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isIntro, value);
  }

  static Future<bool> getIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isIntro) ?? true;
  }

  static setLoc(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLoc, value);
  }

  static Future<bool> getLoc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLoc) ?? true;
  }

  static setInfo(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isInfo, value);
  }

  static Future<bool> getInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isInfo) ?? true;
  }

  static setNotify(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isNotify, value);
  }

  static Future<bool> getNotify() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isNotify) ?? true;
  }

  static setLogin(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLogin, value);
  }

  static Future<bool> getLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLogin) ?? true;
  }

  static setPerson(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLogin, value);
  }

  static Future<bool> getPerson() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isLogin) ?? true;
  }

  static setDarkMode(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(darkMode, value);
  }

  static Future<bool> getDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(darkMode) ?? false;
  }

  static Future<String?> getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    return prefs.getString('email');
  }

  static Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  static Future<String?> getLastname() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastname') ;
  }

  static setNum() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('num', '(303) 555-0105');
  }

  static Future<String> getNum() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('num') ?? '';
  }


//  static  Future<String> getSurname() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     // return await prefs.getString('email')??'';
//     return  await prefs.getString('name')??'';
//
//
//
//
//
//
    static int currentIndex = 0;
//
//
// }
}


