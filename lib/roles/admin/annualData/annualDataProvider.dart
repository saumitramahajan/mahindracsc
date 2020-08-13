import 'package:flutter/widgets.dart';
import 'package:mahindraCSC/z_repository/adminRepository.dart';

class AnnualDataProvider extends ChangeNotifier {
  List<Map<String, String>> assessmentAnnualDataList = [];
  AdminRepository adminRepository = AdminRepository();
  bool loading = true;

  Future<void> getAnnualDataAssessement() async {
    assessmentAnnualDataList = await adminRepository.getAssessmentAnnualData();
    loading = false;
    notifyListeners();
  }
}
