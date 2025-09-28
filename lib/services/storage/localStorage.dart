import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class LocalStorage {

final storage = FlutterSecureStorage();

  Future<bool> setValue(String key, String value) async {
    await storage.write(key: key, value: value);
    return true;
  }

  Future<dynamic> getValue(String key) async {
    return await storage.read(key: key);
  }

  Future<bool> removeValue(String key) async {
    await storage.delete(key: key);
    return true;
  
  }







  // Future<void> setValue(String key, String value) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString(key, value);
  // }

  // Future<String?> getValue(String key) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getString(key);
  // }

}