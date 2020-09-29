import 'package:flutter/material.dart';
import 'package:mahindraCSC/y_check/checkRepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckProvider extends ChangeNotifier {
  bool userExistsBool = false;
  bool loading = true;
  bool error = false;
  bool singleRole = false;
  String role = '';
  CheckRepository checkRepository = CheckRepository();
  CheckProvider() {
    userExists();
  }

  Future<void> userExists() async {
    try {
      userExistsBool = await checkRepository.userExists();
      if (userExistsBool) {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        singleRole = prefs.getBool('singleRole');
        if (singleRole) {
          role = prefs.getString('role');
        }
      }
      loading = false;
      error = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      error = true;
      notifyListeners();
    }
  }
}
