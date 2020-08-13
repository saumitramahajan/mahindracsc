import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mahindraCSC/z_repository/adminRepository.dart';

class EnrollLocationProvider extends ChangeNotifier {
  AdminRepository adminRepository = AdminRepository();
  List<DropdownMenuItem> assessee = [];
  bool loading = true;
  bool enrolled = false;

  EnrollLocationProvider() {
    getDropdownList();
  }

  Future<void> getDropdownList() async {
    try {
      List<Map<String, String>> assesseeList =
          await adminRepository.getAssesseeMap();

      assessee = assesseeList.map((Map<String, String> value) {
        return DropdownMenuItem(
          child: Text(value['Name']),
          value: value['uid'],
        );
      }).toList();
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> enrollMahindraLocation(
      String category,
      String nameOfSector,
      String nameOfBusiness,
      String location,
      String lastAssessmentStage,
      String processLevel,
      String resultLevel,
      String assessee,
      String plantHeadName,
      String plantHeadEmail,
      String plantHeadPhoneNumber,
      String sectorBusinessSafetySpocName,
      String sectorBusinessSafetySpocEmail,
      String sectorBusinessSafetySpocPhoneNumber) async {
    try {
      loading = true;
      notifyListeners();
      adminRepository.mahindraLocationEnroll(
          category,
          nameOfSector,
          nameOfBusiness,
          location,
          lastAssessmentStage,
          processLevel,
          resultLevel,
          assessee,
          plantHeadName,
          plantHeadEmail,
          plantHeadPhoneNumber,
          sectorBusinessSafetySpocName,
          sectorBusinessSafetySpocEmail,
          sectorBusinessSafetySpocPhoneNumber);
      enrolled = true;
      loading = false;
      notifyListeners();
    } catch (e) {
      enrolled = false;
      loading = false;
      notifyListeners();
    }
  }

  Future<void> enrollVendorLocation(
      String nameOfBusiness,
      String location,
      String assessee,
      String plantHeadName,
      String plantHeadEmail,
      String plantHeadPhoneNumber,
      String ssuPersonnelName,
      String ssuPersonnelEmail,
      String ssuPersonnelPhoneNUmber) async {
    try {
      loading = true;
      notifyListeners();
      adminRepository.vendorLocationEnroll(
          nameOfBusiness,
          location,
          assessee,
          plantHeadName,
          plantHeadEmail,
          plantHeadPhoneNumber,
          ssuPersonnelName,
          ssuPersonnelEmail,
          ssuPersonnelPhoneNUmber);
      enrolled = true;
      loading = false;
      notifyListeners();
    } catch (e) {
      enrolled = false;
      loading = false;
      notifyListeners();
    }
  }
}
