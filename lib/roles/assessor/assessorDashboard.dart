import 'package:flutter/material.dart';
import 'package:mahindraCSC/roles/admin/changePassword/changePassword.dart';

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
        backgroundColor: Color(0xfff4001c),
        title: SizedBox(
          height: AppBar().preferredSize.height,
          child: Image.asset(
            'assets/mahindraAppBar.png',
            fit: BoxFit.contain,
          ),
        ),
        titleSpacing: 0.0,
        automaticallyImplyLeading: false,
        actions: [
          FlatButton(
              onPressed: () {
                //getCurrentUser('monthly');
              },
              child: Text(
                'Site Assessment',
                style: TextStyle(color: Colors.white),
              )),
          FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChangePassword(),
                ));
              },
              child: Text(
                'Change Password',
                style: TextStyle(color: Colors.white),
              )),
          FlatButton(
              onPressed: () {},
              child: Text(
                'Sign Out',
                style: TextStyle(color: Colors.white),
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          )
        ],
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
