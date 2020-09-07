import 'package:flutter/widgets.dart';
import 'package:mahindraCSC/z_repository/adminRepository.dart';

class EnrollUsersProvider extends ChangeNotifier {
  AdminRepository adminRepository = AdminRepository();
  bool loading = false;
  bool enrolled = false;

  Future<void> enrollUser(
      String email, String name, bool assessorVal, bool assesseeVal) async {
    try {
      loading = true;
      notifyListeners();
      String uid = await adminRepository.registerUser(email);
      await adminRepository.uploadUserInfo(
          email, uid, name, assessorVal, assesseeVal);
      enrolled = true;
      notifyListeners();
    } catch (e) {
      loading = false;
      enrolled = false;
      notifyListeners();
    }
  }
}
