import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessment.dart';

class AssesseeDashboard extends StatefulWidget {
  @override
  _AssesseeDashboardState createState() => _AssesseeDashboardState();
}

class _AssesseeDashboardState extends State<AssesseeDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Container(
        child: RaisedButton(
          child: Text('Self Assessment'),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  SiteAssessment('self', 'O2ERNcwqH8tv2vOghWo9'),
            ));
          },
        ),
      ),
    );
  }
}
