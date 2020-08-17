import 'package:flutter/widgets.dart';
import 'package:mahindraCSC/z_repository/assessmentRepository.dart';

class SiteAssessmentProvider extends ChangeNotifier {
  AssessentRepository assessentRepository = AssessentRepository();
  List<Map<String, dynamic>> questionList = [];
  List<Map<String, dynamic>> fireQuestions = [];
  List<Map<String, dynamic>> officeQuestions = [];
  Map<String, dynamic> currentQuestion = {};
  int i = 1;
  String type = '';
  String assessmentType = '';
  bool loading = true;
  List<Map<String, dynamic>> fireanswers = [];
  List<bool> officeAnswers = [];
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

  SiteAssessmentProvider(String assessmentTypeI) {
    assessmentType = assessmentTypeI;
    getQuestions();
  }

  Future<void> getQuestions() async {
    try {
      questionList = await assessentRepository.getAssessmentQuestions();
      type = 'assessment';
      print('getDone');
      setMap(type);
      print('mapSet');
      loading = false;
      notifyListeners();
    } catch (e) {
      loading = false;
      notifyListeners();
    }
  }

  void setMap(String typeI) {
    print(i);
    switch (typeI) {
      case 'assessment':
        {
          print('SetmapAssessmentCalled');
          for (int j = 0; j < questionList.length; j++) {
            if (questionList[j]['number'] == i) {
              currentQuestion = questionList[j];
              break;
            }
          }
        }
        break;
      case 'fire':
        {
          print('SetmapFireCalled');
          for (int j = 0; j < fireQuestions.length; j++) {
            if (fireQuestions[j]['number'] == i) {
              print('Fire Set');
              currentQuestion = fireQuestions[j];
              break;
            }
          }
        }
        break;
      case 'office':
        {
          print('SetmapFireCalled');
          for (int j = 0; j < officeQuestions.length; j++) {
            if (officeQuestions[j]['number'] == i) {
              print('Fire Set');
              currentQuestion = officeQuestions[j];
              break;
            }
          }
        }
        break;
    }
  }

  double setAssessment(double value) {
    print(i);
    assessment.removeAt(i - 1);
    assessment.insert(i - 1, value);
    print(assessment.toString());
    i++;
    setMap(type);
    notifyListeners();
    return assessment[i - 1];
  }

  double previousPressed() {
    i--;
    setMap(type);
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
    setMap(type);
  }

  Future<void> getFireQuestions() async {
    try {
      loading = true;
      notifyListeners();
      fireQuestions = await assessentRepository.getFireQuestions();
      i = 1;
      type = 'fire';
      setMap(type);
      loading = false;
      notifyListeners();
    } catch (e) {
      print('FireQuestion Error:: ' + e.toString() + '\n\n');
      loading = false;
      notifyListeners();
    }
  }

  Future<void> setFireAssessment(bool answer, String comment) async {
    Map<String, dynamic> map = {
      'answer': answer,
      'comment': comment,
    };
    if (fireanswers.length < i) {
      fireanswers.add(map);
    } else {
      fireanswers.removeAt(i - 1);
      fireanswers.insert(i - 1, map);
    }
    print(fireanswers.toString());
    i++;
    setMap(type);
  }

  void previousFirePressed() {
    i--;
    setMap(type);
    notifyListeners();
    print('Previous Pressed: with $i');
  }

  Future<void> getOfficeQuestions() async {
    try {
      loading = true;
      notifyListeners();
      officeQuestions = await assessentRepository.getOfficeQuestions();
      i = 1;
      type = 'office';
      setMap(type);
      loading = false;
      notifyListeners();
    } catch (e) {
      print('officeQuestion Error:: ' + e.toString() + '\n\n');
      loading = false;
      notifyListeners();
    }
  }

  Future<void> setOfficeAssessment(bool answer) async {
    if (officeAnswers.length < i) {
      officeAnswers.add(answer);
    } else {
      officeAnswers.removeAt(i - 1);
      officeAnswers.insert(i - 1, answer);
    }
    print(officeAnswers.toString());
    i++;
    setMap(type);
  }
}
