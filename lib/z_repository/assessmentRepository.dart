//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AssessentRepository {
  Future<List<Map<String, dynamic>>> getAssessmentQuestions() async {
    List<Map<String, dynamic>> questionList = [];
    print('Start get questions');
    await Firestore.instance
        .collection('siteAssessment')
        .orderBy('number')
        .getDocuments()
        .then((value) {
      value.documents.forEach((question) {
        Map<String, dynamic> questionMap = {};
        List<List<DropdownMenuItem<double>>> levelMarks = [];
        questionMap['category'] = question.data['category'];
        questionMap['imageLink'] = question.data['imageLink'];
        questionMap['marks'] = question.data['marks'];
        questionMap['number'] = question.data['number'];
        questionMap['statement'] = question.data['statement'];
        List<dynamic> levels = question.data['levelMarks'];
        questionMap['levelMarksBase'] = levels;
        for (int i = 0; i < 5; i++) {
          List<DropdownMenuItem<double>> dropDown = [];
          double start = 0;
          if (i != 0) {
            start = levels[i - 1].toDouble() + 0.5;
          }
          double end = levels[i].toDouble();
          print(start.toString() + end.toString() + '\n\n');
          for (double j = start; j <= end; j = j + .5) {
            DropdownMenuItem<double> drop = DropdownMenuItem(
              child: Text(j.toString()),
              value: j,
            );
            dropDown.add(drop);
          }
          levelMarks.add(dropDown);
        }
        questionMap['levelMarks'] = levelMarks;
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
    print(officeQuestions.toString());
    return officeQuestions;
  }

  Future<Map<String, dynamic>> getLocationInfo(String cycleId) async {
    Map<String, dynamic> data = {};
    DocumentSnapshot docu =
        await Firestore.instance.collection('cycles').document(cycleId).get();
    String location = docu.data['location'];
    QuerySnapshot loca = await Firestore.instance
        .collection('locations')
        .where('location', isEqualTo: location)
        .getDocuments();
    await Firestore.instance
        .collection('locations')
        .document(loca.documents[0].documentID)
        .collection('info')
        .document('info')
        .get()
        .then((value) {
      print('Location Info called:: ' +
          value.data.toString() +
          value.exists.toString());
      if (value.exists) {
        data['documentId'] = loca.documents[0].documentID;
        data['dataExists'] = true;
        data['siteName'] = value.data['siteName'];
        data['occupierName'] = value.data['occupierName'];
        data['occupierEmail'] = value.data['occupierEmail'];
        data['headName'] = value.data['headName'];
        data['headEmail'] = value.data['headEmail'];
        data['safetyInchargeName'] = value.data['safetyInchargeName'];
        data['safetyInchargeEmail'] = value.data['safetyInchargeEmail'];
        data['fireInchargeName'] = value.data['fireInchargeName'];
        data['fireInchargeEmail'] = value.data['fireInchargeEmail'];
        data['officeSafetyInchargeName'] =
            value.data['officeSafetyInchargeName'];
        data['officeSafetyInchargeEmail'] =
            value.data['officeSafetyInchargeEmail'];
        data['utilitiesName'] = value.data['utilitiesName'];
        data['utilitiesEmail'] = value.data['utilitiesEmail'];
        data['rule'] = value.data['rule'];
        data['ruleValue'] = value.data['ruleValue'];
        data['lpg'] = value.data['lpg'];
        data['lpgValue'] = value.data['lpgValue'];
        data['gasoline'] = value.data['gasoline'];
        data['gasolineValue'] = value.data['gasolineValue'];
        data['cng'] = value.data['cng'];
        data['cngValue'] = value.data['cngValue'];
        data['paintShop'] = value.data['paintShop'];
        data['paintShopValue'] = value.data['paintShopValue'];
        data['foundry'] = value.data['foundry'];
        data['foundryValue'] = value.data['foundryValue'];
        data['pressValue'] = value.data['pressValue'];
        data['press'] = value.data['press'];
        data['diesel'] = value.data['diesel'];
        data['dieselValue'] = value.data['dieselValue'];
        data['thinner'] = value.data['thinner'];
        data['thinnerValue'] = value.data['thinnerValue'];
        data['toxic'] = value.data['toxic'];
        data['toxicValue'] = value.data['toxicValue'];
        data['heat'] = value.data['heat'];
        data['heatValue'] = value.data['heatValue'];
        data['testBed'] = value.data['testBed'];
        data['testBedValue'] = value.data['testBedValue'];
        data['ibr'] = value.data['ibr'];
        data['ibrValue'] = value.data['ibrValue'];
        data['fatal'] = value.data['fatal'];
        data['reportable'] = value.data['reportable'];
        data['nonReportable'] = value.data['nonReportable'];
        data['firstAid'] = value.data['firstAid'];
        data['fire'] = value.data['fire'];
      } else {
        data['documentId'] = loca.documents[0].documentID;
        data['dataExists'] = false;
      }
    });
    return data;
  }

  Future<void> uploadSelfAssessment(
      List<Map<String, dynamic>> map, String cycleId) async {
    await Firestore.instance
        .collection('cycles')
        .document(cycleId)
        .updateData({'selfAssessment': map});
  }

  Future<void> uploadSelfAssessmentFire(
      List<Map<String, dynamic>> map, String cycleId) async {
    await Firestore.instance
        .collection('cycles')
        .document(cycleId)
        .updateData({'selfAssessmentFire': map});
  }

  Future<void> uploadSelfAssessmentOffice(
      List<Map<String, dynamic>> map, String cycleId) async {
    await Firestore.instance
        .collection('cycles')
        .document(cycleId)
        .updateData({'selfAssessmentOffice': map});

    await Firestore.instance
        .collection('cycles')
        .document(cycleId)
        .updateData({'currentStatus': 'Self Assessment Uploaded'});
  }

  Future<void> uploadSiteAssessment(
      List<Map<String, dynamic>> map, String cycleId) async {
    await Firestore.instance
        .collection('cycles')
        .document(cycleId)
        .updateData({'siteAssessment': map});
  }

  Future<void> uploadSiteAssessmentFire(
      List<Map<String, dynamic>> map, String cycleId) async {
    await Firestore.instance
        .collection('cycles')
        .document(cycleId)
        .updateData({'siteAssessmentFire': map});
  }

  Future<void> uploadSiteAssessmentOffice(
      List<Map<String, dynamic>> map, String cycleId) async {
    await Firestore.instance
        .collection('cycles')
        .document(cycleId)
        .updateData({'siteAssessmentOffice': map});

    await Firestore.instance
        .collection('cycles')
        .document(cycleId)
        .updateData({'currentStatus': 'Site Assessment Uploaded'});
  }

  //Future<String> uploadFile(File file) async {}
}
