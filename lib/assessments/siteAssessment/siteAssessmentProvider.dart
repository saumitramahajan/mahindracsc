import 'package:flutter/widgets.dart';
import 'package:mahindraCSC/z_repository/assessmentRepository.dart';

class SiteAssessmentProvider extends ChangeNotifier {
  AssessentRepository assessentRepository = AssessentRepository();
  List<Map<String, dynamic>> questionList = [];
  Map<String, dynamic> currentQuestion = {};
  int i = 1;
  bool loading = true;
  List<double> assessment = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  double assessmentTotal = 0;

  SiteAssessmentProvider() {
    getQuestions();
  }

  Future<void> getQuestions() async {
    try {
      questionList = await assessentRepository.getAssessmentQuestions();
      print('getDone');
      setMap();
      print('mapSet');
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
    }
  }

  void setMap() {
    print(i);
    for (int j = 0; j < questionList.length; j++) {
      if (questionList[j]['number'] == i) {
        currentQuestion = questionList[j];
        break;
      }
    }
  }

  double setAssessment(double value) {
    print(i);
    assessment.removeAt(i - 1);
    assessment.insert(i - 1, value);
    print(assessment.toString());
    i++;
    setMap();
    notifyListeners();
    return assessment[i - 1];
  }

  double previousPressed() {
    i--;
    setMap();
    notifyListeners();
    print('Previous Pressed: with $i');
    return assessment[i - 1];
  }

  void submited(double value) {
    assessment.removeAt(i - 1);
    assessment.insert(i - 1, value);
    assessmentTotal = 0;
    for (i = 0; i < assessment.length; i++) {
      assessmentTotal = assessmentTotal + assessment[i];
    }
    print(assessment.toString());
  }

  void beforeSubmitTapped(int value) {
    i = value;
    setMap();
  }
}
