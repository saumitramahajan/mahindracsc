import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessment.dart';
import 'package:mahindraCSC/roles/assessee/assesseeProvider.dart';
import 'package:mahindraCSC/roles/assessee/changePassword/changePassword.dart';
import 'package:carousel_pro/carousel_pro.dart';
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

    if (type == 'assessment') {
      String cycleId;
      await Firestore.instance
          .collection('cycles')
          .where('assesseeUid', isEqualTo: assesseeUid)
          .getDocuments()
          .then((cyclesQS) {
        cycleId = cyclesQS.documents[0].documentID;
      });
      var isIT = loc.indexOf("IT");
      if (isIT == -1) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MonthlySafetyReport(
            type: type,
            cycleId: cycleId,
          );
        }));
      } else {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return MonthlySafetyReportIT(
            type: type,
            cycleId: cycleId,
          );
        }));
      }
    } else {
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
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AssesseeProvider>(context);
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
                getCurrentUser('monthly');
              },
              child: Text(
                'Monthly MIS',
                style: TextStyle(color: Colors.white),
              )),
          FlatButton(
              onPressed: () async {
                String cycleid = await provider.getLocationName();
                await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SiteAssessment('self', cycleid),
                ));
              },
              child: Text(
                'Self Assessment',
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
          /*FlatButton(
              onPressed: () {
                getCurrentUser('assessment');
              },
              child: Text(
                'Annual Data',
                style: TextStyle(color: Colors.white),
              )),*/ //Uncomment when annual data is required. place inbetween
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
