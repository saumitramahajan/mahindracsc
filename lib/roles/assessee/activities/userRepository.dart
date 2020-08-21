import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class ActivitiesRepository {
  File pdfFile;
  bool uploaded = false;
  Future<String> getUid() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  Future<List<Map<String, dynamic>>> getDetails() async {
    String uid = await getUid();
    print('$uid');

    QuerySnapshot activities =
        await Firestore.instance.collection('activities').getDocuments();
    List<Map<String, dynamic>> activity = [];

    for (int i = 0; i < activities.documents.length; i++) {
      List<dynamic> showTo = activities.documents[i]['showTo'];
      for (int j = 0; j < showTo.length; j++) {
        Map<String, dynamic> map = {};
        if (showTo[j]['role'] == 'assessee' && showTo[j]['uid'] == uid) {
          map['content'] = activities.documents[i]['content'];
          Timestamp date = activities.documents[i]['date'];
          DateTime dateTime =
              DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch);

          map['date'] = DateFormat('dd-MM-yyyy hh:mm').format(dateTime);

          map['type'] = showTo[j]['type'];
          map['cycleDocumentID'] = activities.documents[i]['cycleDocumentID'];
          print(map.toString());
          activity.add(map);
        }
      }
    }
    return activity;
  }
}
