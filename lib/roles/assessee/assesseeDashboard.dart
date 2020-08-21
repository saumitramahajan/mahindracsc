import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessment.dart';
import 'package:mahindraCSC/roles/assessee/activities/activities.dart';
import 'package:mahindraCSC/roles/assessee/activities/loginProvider.dart';
import 'package:provider/provider.dart';

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
        child: Column(
          children: [
            RaisedButton(
              child: Text('Self Assessment'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      SiteAssessment('self', 'u9TJ1X75g6fH16HBzRdH'),
                ));
              },
            ),
            RaisedButton(
              child: Text('Activities'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return ChangeNotifierProvider(
                      create: (_) => ActivitiesProvider(),
                      child: Activities(),
                    );
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
