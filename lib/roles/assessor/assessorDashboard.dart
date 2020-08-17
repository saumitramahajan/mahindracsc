import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessment.dart';

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
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text('Site Assessment'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SiteAssessment('site')));
              },
            ),
          ],
        ),
      ),
    );
  }
}
