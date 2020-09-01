import 'locations.dart';
import 'assessmentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
      ),
      body: Center(
          child: Column(
        children: [
          RaisedButton(
              child: Text('SelfAssessment'),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ChangeNotifierProvider(
                      create: (_) => AssessmentProvider('self'),
                      child: Locations(),
                    );
                  }),
                );
              }),
          RaisedButton(
              child: Text('SiteAssessment'),
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return ChangeNotifierProvider(
                      create: (_) => AssessmentProvider('site'),
                      child: Locations(),
                    );
                  }),
                );
              }),
        ],
      )),
    );
  }
}
