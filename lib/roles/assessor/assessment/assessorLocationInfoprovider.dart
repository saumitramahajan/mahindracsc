import 'assessorLocationInfoRepository.dart';
import 'package:flutter/cupertino.dart';

class AssessmentLocationInfoProvider extends ChangeNotifier {
  bool loading = true;
  bool success = false;

  Map<String, dynamic> infoMap = {};

  final AssessmentLocationInfoRepository assessmentRepository =
      AssessmentLocationInfoRepository();

  AssessmentLocationInfoProvider(String locationId) {
    assessorInfo(locationId);
  }

  Future<void> assessorInfo(String locationId) async {
    try {
      infoMap = await assessmentRepository.getassessorInfo(locationId);

      loading = false;
      success = true;
      notifyListeners();
    } catch (e) {
      print('assessorInfo error::' + e.toString() + '\n\n');
      loading = false;
      success = false;
      notifyListeners();
    }
  }
}
