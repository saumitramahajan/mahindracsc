import 'package:flutter/material.dart';
import 'package:mahindraCSC/roles/admin/annualData/annualData.dart';
import 'package:mahindraCSC/roles/admin/changePassword/changePassword.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/enrollLoacation.dart';
import 'package:mahindraCSC/roles/admin/enrollUsers/enrollUsers.dart';
import 'package:mahindraCSC/roles/admin/review/dashboard.dart';
import '../scheduleAssessment/scheduleAssessment.dart';
import 'package:carousel_pro/carousel_pro.dart';

class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
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
          DropdownButton(
            items: [
              DropdownMenuItem(
                child: Text(
                  'Dashboard',
                  style: TextStyle(color: Colors.white),
                ),
                value: 'dashboard',
              ),
              DropdownMenuItem(
                child: Text(
                  'Enroll',
                  style: TextStyle(color: Colors.white),
                ),
                value: 'enroll',
              ),
              DropdownMenuItem(
                child: Text(
                  'Enroll Location',
                  style: TextStyle(color: Colors.white),
                ),
                value: 'location',
              ),
              DropdownMenuItem(
                child: Text(
                  'Schedule Assessment',
                  style: TextStyle(color: Colors.white),
                ),
                value: 'schedule',
              ),
              DropdownMenuItem(
                child: Text(
                  'Review Annual Data',
                  style: TextStyle(color: Colors.white),
                ),
                value: 'annualData',
              ),
              DropdownMenuItem(
                child: Text(
                  'Review Self and Site Assessment',
                  style: TextStyle(color: Colors.white),
                ),
                value: 'review',
              ),
              DropdownMenuItem(
                child: Text(
                  'Change Password',
                  style: TextStyle(color: Colors.white),
                ),
                value: 'change',
              ),
              DropdownMenuItem(
                child: Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.white),
                ),
                value: 'signOut',
              )
            ],
            onChanged: (value) {
              switch (value) {
                case 'enroll':
                  {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return EnrollUsers();
                      },
                    ));
                  }
                  break;
                case 'dashboard':
                  {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) {
                        return AdminDashboard();
                      },
                    ));
                  }
                  break;
                case 'location':
                  {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return EnrollLocation();
                      },
                    ));
                  }
                  break;
                case 'schedule':
                  {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ScheduleAssessment();
                      },
                    ));
                  }
                  break;
                case 'annualData':
                  {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return AnnualData();
                      },
                    ));
                  }
                  break;
                case 'review':
                  {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return Dashboard();
                      },
                    ));
                  }
                  break;
                case 'change':
                  {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return ChangePassword();
                      },
                    ));
                  }
                  break;
                case 'signOut':
                  {}
                  break;
              }
            },
            value: 'dashboard',
            dropdownColor: Color(0xfff4001c),
          ),
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
              dotBgColor: Colors.transparent,
              autoplayDuration: Duration(seconds: 6),
              showIndicator: false,
            ),
          )),
          SliverGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2,
              children: [
                Container(
                  color: Colors.red[50],
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: Column(
                    children: [
                      Text('Scheduled Assessment: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text('2',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 70))
                    ],
                  ),
                ),
                Container(
                  color: Colors.red[100],
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: Column(
                    children: [
                      Text('Self Assessment Uploaded: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text('1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 70))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  color: Colors.red[200],
                  child: Column(
                    children: [
                      Text('Site Assessment Uploaded: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text('1',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 70))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  color: Colors.red[300],
                  child: Column(
                    children: [
                      Text('Closed: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      //SizedBox(height: 20),
                      Text('0',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 70))
                    ],
                  ),
                )
              ])
        ],
      ),
    );
  }
}
