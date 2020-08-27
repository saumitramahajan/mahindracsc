import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessment.dart';
import 'package:mahindraCSC/roles/assessee/activities/activities.dart';
import 'package:mahindraCSC/roles/assessee/activities/loginProvider.dart';
import 'package:provider/provider.dart';

import 'annualData/MonthlySafetyReportIT.dart';
import 'annualData/monthly_safety_report.dart';

class AssesseeDashboard extends StatefulWidget {
  @override
  _AssesseeDashboardState createState() => _AssesseeDashboardState();
}

class _AssesseeDashboardState extends State<AssesseeDashboard> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String assesseeUid = '';
  String loc = '';

  getCurrentUser(String type) async {
    final FirebaseUser user = await auth.currentUser();
    final uid = user.uid;
    // Similarly we can get email as well
    //final uemail = user.email;b
    print(uid);
    assesseeUid = uid;
    getAssesseeLocation(type);
    //print(uemail);
  }

  Future<void> getAssesseeLocation(String type) async {
    CollectionReference ref = Firestore.instance.collection('locations');
    QuerySnapshot eventsQuery =
        await ref.where("assessee", isEqualTo: assesseeUid).getDocuments();
    loc = eventsQuery.documents[0]['category'];
    String locationId = eventsQuery.documents[0].documentID;
    print(locationId);
    var isIT = loc.indexOf("IT");
    if (isIT == -1) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return MonthlySafetyReport(
          type: type,
          locationId: locationId,
        );
      }));
    } else {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return MonthlySafetyReportIT(
          type: type,
          locationId: locationId,
        );
      }));
      return loc;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text('Monthly MIS'),
              onPressed: () {
                getCurrentUser('monthly');
              },
            ),
            RaisedButton(
              child: Text('Assessment Annual Data'),
              onPressed: () {
                getCurrentUser('assessment');
              },
            ),
            RaisedButton(
                child: Text('Self Assessment'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        SiteAssessment('self', 'fh4nK1KHz5DeEn0BkHL3'),
                  ));
                }),
          ],
        ),
      ),
    );
  }
}
