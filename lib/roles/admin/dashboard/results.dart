/*import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
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
      loading= false;
    });
    print('total' + total.toString());
  }

  @override
  void initState() {
    getAssessmentNumbers();

    super.initState();
  }

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
      body:loading?Center(child:CircularProgressIndicator()): CustomScrollView(
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
              childAspectRatio: 1.0,
              children: [
                Container(
                  color: Colors.green[50],
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: Column(
                    children: [
                      Text('Scheduled Assessment: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(total.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 70))
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
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(self.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 70))
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
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(site.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 70))
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
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      SizedBox(height: 20),
                      Text(closed.toString(),
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
*/
