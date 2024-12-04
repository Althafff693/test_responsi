import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  // Fungsi untuk menyimpan data username dan password
  static Future<void> saveLoginData(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('password', password);
  }

  // Fungsi untuk mengambil data username
  static Future<String?> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  // Fungsi untuk mengambil data password
  static Future<String?> getPassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('password');
  }

  // Fungsi untuk menghapus data login (logout)
  static Future<void> clearLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('password');
  }
}
