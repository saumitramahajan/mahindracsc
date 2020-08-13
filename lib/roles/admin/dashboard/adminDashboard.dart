import 'package:flutter/material.dart';
import 'package:mahindraCSC/roles/admin/annualData/annualData.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/enrollLoacation.dart';
import 'package:mahindraCSC/roles/admin/enrollUsers/enrollUsers.dart';
import '../scheduleAssessment/scheduleAssessment.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RaisedButton(
              child: Text('Enroll'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return EnrollUsers();
                  },
                ));
              },
            ),
            RaisedButton(
                child: Text('Enroll Location'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return EnrollLocation();
                    },
                  ));
                }),
            RaisedButton(
                child: Text('Schedule Assessment'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ScheduleAssessment();
                    },
                  ));
                }),
            RaisedButton(
                child: Text('Review Annual Data'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return AnnualData();
                    },
                  ));
                })
          ],
        ),
      ),
    );
  }
}
