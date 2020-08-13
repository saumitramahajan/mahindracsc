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
}
