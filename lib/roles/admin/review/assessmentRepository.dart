import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AssessmentRepository {
  Future<String> getUid() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  Future<List<Map<String, String>>> getLocation() async {
    List<Map<String, String>> locationList = [];

    QuerySnapshot cycles =
        await Firestore.instance.collection('cycles').getDocuments();
    for (int i = 0; i < cycles.documents.length; i++) {
      if (cycles.documents[i].data.containsKey('selfAssessment')) {
        Map<String, String> locationMap = {
          'location': cycles.documents[i].data['location'],
          'name': cycles.documents[i].data['name'],
          'documentId': cycles.documents[i].documentID
        };
        locationList.add(locationMap);
      }
    }
    print(locationList.toString());
    return locationList;
  }

  Future<List<Map<String, dynamic>>> getSelfAssessmentData(
      String documentID) async {
    List<Map<String, dynamic>> assessmentDataList = [];

    DocumentSnapshot dataDS = await Firestore.instance
        .collection('cycles')
        .document(documentID)
        .get();
    List<dynamic> selfAssessmentList = dataDS.data['selfAssessment'];

    for (int i = 0; i < selfAssessmentList.length; i++) {
      Map<String, dynamic> dataMap = {};

      dataMap['answer'] = selfAssessmentList[i]['answer'];
      dataMap['comment'] = selfAssessmentList[i]['comment'];
      dataMap['fileUrl'] = selfAssessmentList[i]['fileUrl'];
      dataMap['level'] = selfAssessmentList[i]['level'];
      assessmentDataList.add(dataMap);
    }
    print('Data lenght:: ' + assessmentDataList.length.toString() + '\n\n');
    return assessmentDataList;
  }

  Future<List<Map<String, dynamic>>> getFireAssessmentData(
      String documentID) async {
    List<Map<String, dynamic>> fireAssessmentDataList = [];

    DocumentSnapshot dataDS = await Firestore.instance
        .collection('cycles')
        .document(documentID)
        .get();
    List<dynamic> fireAssessmentList = dataDS.data['selfAssessmentFire'];

    for (int i = 0; i < fireAssessmentList.length; i++) {
      Map<String, dynamic> dataMap = {};

      dataMap['answer'] = fireAssessmentList[i]['answer'];
      dataMap['comment'] = fireAssessmentList[i]['comment'];
      fireAssessmentDataList.add(dataMap);
    }

    return fireAssessmentDataList;
  }

  Future<List<dynamic>> getOfficeAssessmentData(String documentID) async {
    DocumentSnapshot dataDS = await Firestore.instance
        .collection('cycles')
        .document(documentID)
        .get();
    List<dynamic> officeAssessmentList = dataDS.data['selfAssessmentOffice'];
    return officeAssessmentList;
  }

  Future<List<Map<String, dynamic>>> getSiteAssessmentData(
      String documentID) async {
    List<Map<String, dynamic>> siteAssessmentDataList = [];
    DocumentSnapshot dataDS = await Firestore.instance
        .collection('cycles')
        .document(documentID)
        .get();
    List<dynamic> siteAssessmentList = dataDS.data['siteAssessment'];

    for (int i = 0; i < siteAssessmentList.length; i++) {
      Map<String, dynamic> dataMap = {};

      dataMap['answer'] = siteAssessmentList[i]['answer'];
      dataMap['comment'] = siteAssessmentList[i]['comment'];
      dataMap['fileUrl'] = siteAssessmentList[i]['fileUrl'];
      dataMap['level'] = siteAssessmentList[i]['level'];
      dataMap['suggestion'] = siteAssessmentList[i]['suggestion'];
      siteAssessmentDataList.add(dataMap);
    }
    print('Data lenght:: ' + siteAssessmentDataList.length.toString() + '\n\n');
    return siteAssessmentDataList;
  }

  Future<List<Map<String, dynamic>>> getSiteFireAssessmentData(
      String documentID) async {
    List<Map<String, dynamic>> fireAssessmentDataList = [];

    DocumentSnapshot dataDS = await Firestore.instance
        .collection('cycles')
        .document(documentID)
        .get();
    List<dynamic> fireAssessmentList = dataDS.data['siteAssessmentFire'];

    for (int i = 0; i < fireAssessmentList.length; i++) {
      Map<String, dynamic> dataMap = {};

      dataMap['answer'] = fireAssessmentList[i]['answer'];
      dataMap['marks'] = fireAssessmentList[i]['marks'];
      dataMap['comment'] = fireAssessmentList[i]['comment'];
      fireAssessmentDataList.add(dataMap);
    }

    return fireAssessmentDataList;
  }

  Future<List<dynamic>> getSiteOfficeAssessmentData(String documentID) async {
    DocumentSnapshot dataDS = await Firestore.instance
        .collection('cycles')
        .document(documentID)
        .get();
    List<dynamic> officeAssessmentList = dataDS.data['siteAssessmentOffice'];
    return officeAssessmentList;
  }

  Future<List<Map<String, String>>> getsiteAssessmentStatement() async {
    List<Map<String, String>> statementList = [];

    QuerySnapshot siteAssessment = await Firestore.instance
        .collection('siteAssessment')
        .orderBy('number')
        .getDocuments();
    for (int i = 0; i < siteAssessment.documents.length; i++) {
      Map<String, String> statementMap = {
        'statement': siteAssessment.documents[i].data['statement'],
      };
      statementList.add(statementMap);
    }

    return statementList;
  }

  Future<List<Map<String, String>>> getsiteAssessmentStatementFire() async {
    List<Map<String, String>> statementListFire = [];

    QuerySnapshot siteAssessmentFire = await Firestore.instance
        .collection('siteAssessmentFire')
        .orderBy('number')
        .getDocuments();
    for (int i = 0; i < siteAssessmentFire.documents.length; i++) {
      Map<String, String> statementMap = {
        'statement': siteAssessmentFire.documents[i].data['statement'],
      };
      statementListFire.add(statementMap);
    }

    return statementListFire;
  }

  Future<List<Map<String, String>>> getsiteAssessmentStatementOffice() async {
    List<Map<String, String>> statementListOffice = [];

    QuerySnapshot siteAssessmentOffice = await Firestore.instance
        .collection('siteAssessmentOffice')
        .orderBy('number')
        .getDocuments();
    for (int i = 0; i < siteAssessmentOffice.documents.length; i++) {
      Map<String, String> statementMap = {
        'statement': siteAssessmentOffice.documents[i].data['statement'],
      };
      statementListOffice.add(statementMap);
    }

    return statementListOffice;
  }

  Future<void> approve(String cycleId) async {
    await Firestore.instance
        .collection('cycles')
        .document(cycleId)
        .updateData({'currentStatus': 'Closed'});
  }
}
