import 'package:flutter/widgets.dart';
import 'package:mahindraCSC/z_repository/adminRepository.dart';

class ViewLocationProvider extends ChangeNotifier {
  AdminRepository adminRepository = AdminRepository();
  bool loading = true;
  List<Map<String, String>> list = [];
  String error = 'start';

  ViewLocationProvider() {
    getLocationList();
  }

  Future<void> getLocationList() async {
    try {
      list = await adminRepository.getLocationMap();
      error = list.toString();
    } catch (e) {
      error = e.toString();
    }
    loading = false;
    notifyListeners();
  }
}
