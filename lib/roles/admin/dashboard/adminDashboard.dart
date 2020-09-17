import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mahindraCSC/roles/admin/annualData/annualData.dart';
import 'package:mahindraCSC/roles/admin/changePassword/changePassword.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/enrollLoacation.dart';
import 'package:mahindraCSC/roles/admin/enrollUsers/enrollUsers.dart';
import 'package:mahindraCSC/roles/admin/review/assessmentProvider.dart';
import 'package:mahindraCSC/roles/admin/review/locations.dart';
import 'package:provider/provider.dart';
import '../../../utilities.dart';
import '../scheduleAssessment/scheduleAssessment.dart';
import 'package:carousel_pro/carousel_pro.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int total = 0;
  int self = 0;
  int site = 0;
  int closed = 0;
  String currentStatus;
  bool loading = true;

  Future<void> getAssessmentNumbers() async {
    final QuerySnapshot qSnap =
        await Firestore.instance.collection('cycles').getDocuments();
    total = qSnap.documents.length;
    print(qSnap.toString());
    for (int i = 0; i < total; i++) {
      currentStatus = qSnap.documents[i].data['currentStatus'];

      switch (currentStatus) {
        case 'Self Assessment Uploaded':
          {
            self++;
          }
          break;
        case 'Site Assessment Uploaded':
          {
            site++;
          }
          break;
        case 'Closed':
          {
            closed++;
          }
          break;
      }
    }
    setState(() {
      loading = false;
    });
    print('total' + total.toString());
  }

  @override
  void initState() {
    getAssessmentNumbers();

    super.initState();
  }

  Utilities utilities = Utilities();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Scaffold(
            endDrawer: Drawer(
              child: Container(
                color: utilities.mainColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        'Enroll',
                        style: TextStyle(color: Colors.white),
                      ),
                      dense: false,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return EnrollUsers();
                          },
                        ));
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Enroll Location',
                        style: TextStyle(color: Colors.white),
                      ),
                      dense: false,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return EnrollLocation();
                          },
                        ));
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Schedule Assessment',
                        style: TextStyle(color: Colors.white),
                      ),
                      dense: false,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return ScheduleAssessment();
                          },
                        ));
                      },
                    ),
                    /* ListTile(
                title: Text(
                  'Review Annual Data',
                  style: TextStyle(color: Colors.white),
                ),
                dense: false,
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return AnnualData();
                    },
                  ));
                },
              ),*/
                    ExpansionTile(
                      title: Text(
                        'Review Self and Site Assessment',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing:
                          Icon(Icons.arrow_drop_down, color: Colors.white),
                      expandedAlignment: Alignment.centerLeft,
                      children: [
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return ChangeNotifierProvider<
                                      AssessmentProvider>(
                                    create: (_) => AssessmentProvider('self'),
                                    child: Locations(),
                                  );
                                }),
                              );
                            },
                            child: Text(
                              'Self Assessment',
                              style: TextStyle(color: Colors.white),
                            )),
                        FlatButton(
                            onPressed: () async {
                              Navigator.of(context).pop();
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return ChangeNotifierProvider<
                                      AssessmentProvider>(
                                    create: (_) => AssessmentProvider('site'),
                                    child: Locations(),
                                  );
                                }),
                              );
                            },
                            child: Text(
                              'Site Assessment',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    ),
                    ListTile(
                      title: Text(
                        'Change Password',
                        style: TextStyle(color: Colors.white),
                      ),
                      dense: false,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return ChangePassword();
                          },
                        ));
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: Text(
                        'Sign Out',
                        style: TextStyle(color: Colors.white),
                      ),
                      dense: false,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            ),
            appBar: AppBar(
              backgroundColor: utilities.mainColor,
              titleSpacing: 0.0,
              automaticallyImplyLeading: false,
            ),
            body: loading
                ? Center(child: CircularProgressIndicator())
                : CustomScrollView(
                    slivers: [
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
                      SliverGrid.count(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10.0,
                          crossAxisSpacing: 10.0,
                          childAspectRatio: 2,
                          children: [
                            Container(
                              color: Colors.green[50],
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                              child: Column(
                                children: [
                                  Text('Scheduled Assessment: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  Text(total.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 70))
                                ],
                              ),
                            ),
                            Container(
                              color: Colors.green[100],
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                              child: Column(
                                children: [
                                  Text('Self Assessment Uploaded: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  Text(self.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 70))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                              color: Colors.green[200],
                              child: Column(
                                children: [
                                  Text('Site Assessment Uploaded: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  Text(site.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 70))
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                              color: Colors.green[300],
                              child: Column(
                                children: [
                                  Text('Closed: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                  Text(closed.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 70))
                                ],
                              ),
                            )
                          ])
                    ],
                  ),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: SizedBox(
            height: AppBar().preferredSize.height * 2,
            child: Image.asset(
              'assets/mahindraAppBar.png',
              fit: BoxFit.contain,
            ),
          ),
        )
      ],
    );
  }
}
