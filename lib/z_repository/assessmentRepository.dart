import 'package:cloud_firestore/cloud_firestore.dart';

class AssessentRepository {
  Future<List<Map<String, dynamic>>> getAssessmentQuestions() async {
    List<Map<String, dynamic>> questionList = [];
    print('Start');
    await Firestore.instance
        .collection('siteAssessment')
        .orderBy('number')
        .getDocuments()
        .then((value) {
      value.documents.forEach((question) {
        Map<String, dynamic> questionMap = {};
        questionMap['category'] = question.data['category'];
        questionMap['scheme'] = question.data['scheme'];
        questionMap['marks'] = question.data['marks'];
        questionMap['number'] = question.data['number'];
        questionMap['statement'] = question.data['statement'];
        questionList.add(questionMap);
        print('Done ${question.documentID}');
      });
    });
    return questionList;
  }

  Future<List<Map<String, dynamic>>> getFireQuestions() async {
    List<Map<String, dynamic>> fireQuestions = [];
    await Firestore.instance
        .collection('siteAssessmentFire')
        .getDocuments()
        .then((questionQS) {
      questionQS.documents.forEach((questionDS) {
        Map<String, dynamic> map = {};
        map['statement'] = questionDS.data['statement'];
        map['condition'] = questionDS.data['condition'];
        map['validation'] = questionDS.data['validation'];
        map['number'] = questionDS.data['number'];
        fireQuestions.add(map);
      });
    });
    return fireQuestions;
  }

  Future<List<Map<String, dynamic>>> getOfficeQuestions() async {
    List<Map<String, dynamic>> officeQuestions = [];
    await Firestore.instance
        .collection('siteAssessmentOffice')
        .getDocuments()
        .then((questionQS) {
      questionQS.documents.forEach((questionDS) {
        Map<String, dynamic> map = {};
        map['statement'] = questionDS.data['statement'];
        map['condition'] = questionDS.data['condition'];
        map['validation'] = questionDS.data['validation'];
        map['number'] = questionDS.data['number'];
        officeQuestions.add(map);
      });
    });
    return officeQuestions;
  }
}
