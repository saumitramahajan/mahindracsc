import 'assessmentRepository.dart';
import 'package:flutter/cupertino.dart';

class AssessmentProvider extends ChangeNotifier {
  bool loading = true;
  bool success = false;
  bool dataLoading = true;
  String assessmentType = '';

  List<Map<String, dynamic>> listOfAssessment = [];

  List<Map<String, dynamic>> listOfFireAssessment = [];
  List<Map<String, dynamic>> listOfSiteAssessment = [];
  List<dynamic> listOfOfficeAssessment = [];
  List<Map<String, String>> listOfStatement = [];
  List<Map<String, String>> listOfStatementFire = [];
  List<Map<String, String>> listOfStatementOffice = [];

  List<Map<String, String>> listOfLocations = [];
  final AssessmentRepository assessmentRepository = AssessmentRepository();

  AssessmentProvider(String type) {
    assessmentType = type;
    check();
  }

  Future<void> check() async {
    try {
      listOfLocations = await assessmentRepository.getLocation();

      loading = false;
      success = true;
      notifyListeners();
    } catch (e) {
      print('check error::' + e.toString() + '\n\n');
      loading = false;
      success = false;
      notifyListeners();
    }
  }

  Future<void> locations(String documentId) async {
    try {
      if (assessmentType == 'self') {
        listOfAssessment =
            await assessmentRepository.getSelfAssessmentData(documentId);
        listOfFireAssessment =
            await assessmentRepository.getFireAssessmentData(documentId);
        listOfOfficeAssessment =
            await assessmentRepository.getOfficeAssessmentData(documentId);
      } else {
        //call function to get siteAssessmentData
        listOfAssessment =
            await assessmentRepository.getSiteAssessmentData(documentId);
        listOfFireAssessment =
            await assessmentRepository.getSiteFireAssessmentData(documentId);
        listOfOfficeAssessment =
            await assessmentRepository.getSiteOfficeAssessmentData(documentId);
      }
      listOfStatement = await assessmentRepository.getsiteAssessmentStatement();
      listOfStatementFire =
          await assessmentRepository.getsiteAssessmentStatementFire();
      listOfStatementOffice =
          await assessmentRepository.getsiteAssessmentStatementOffice();

      dataLoading = false;
      success = true;
      notifyListeners();
    } catch (e) {
      print('location error::' + e.toString() + '\n\n');
      dataLoading = false;
      success = false;
      notifyListeners();
    }
  }

  void approve(String cycleId) async {
    assessmentRepository.approve(cycleId);
  }
}
