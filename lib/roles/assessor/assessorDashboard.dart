import 'package:flutter/material.dart';
import 'package:mahindraCSC/roles/assessor/changePassword/changePassword.dart';
import 'package:carousel_pro/carousel_pro.dart';
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AssessorLocationInfoBase()));
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 10.0,
            ),
          ),
          SliverToBoxAdapter(
              child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Carousel(
                boxFit: BoxFit.fitWidth,
                images: [
                  AssetImage('assets/Picture1.png'),
                  AssetImage('assets/Picture2.png'),
                  AssetImage('assets/Picture3.png'),
                ],
                autoplay: true,
                indicatorBgPadding: 0,
                dotBgColor: Colors.transparent),
          )),
        ],
      ),
    );
  }
}
