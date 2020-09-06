import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessment.dart';
import 'package:mahindraCSC/roles/assessor/activities/activities.dart';
import 'package:mahindraCSC/roles/assessor/activities/loginProvider.dart';
import 'package:mahindraCSC/roles/assessor/assessment/assessorLocationList.dart';
import 'package:provider/provider.dart';

import 'assessment/assessorlocationListBase.dart';

class AssessorDashboard extends StatefulWidget {
  @override
  _AssessorDashboardState createState() => _AssessorDashboardState();
}

class _AssessorDashboardState extends State<AssessorDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text('Site Assessment'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AssessorLocationInfoBase()
                    //SiteAssessment('site', 'fh4nK1KHz5DeEn0BkHL3')
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
