import 'package:cloud_firestore/cloud_firestore.dart';

import 'assessmentProvider.dart';
import 'dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelfAssessment extends StatefulWidget {
  String documentId;
  SelfAssessment({Key key, @required this.documentId}) : super(key: key);
  @override
  _SelfAssessmentState createState() => _SelfAssessmentState();
}

class _SelfAssessmentState extends State<SelfAssessment> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AssessmentProvider>(context);
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
        ),
        body: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Column(
                  children: [
                    Expanded(
                        child: CustomScrollView(
                      slivers: <Widget>[
                        SliverAppBar(
                          title: (provider.assessmentType == 'self')
                              ? Text("Self Assessment")
                              : Text('Site Assessment'),
                          expandedHeight: 30.0,
                          pinned: false,
                          floating: false,
                          flexibleSpace: FlexibleSpaceBar(),
                        ),
                        /* Row(
                          children: [
                            Container(
                                padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                                child: Text(
                                  'Statement',
                                  style: TextStyle(color: Colors.grey[600]),
                                )),
                            Container(
                                padding: EdgeInsets.fromLTRB(150, 10, 10, 10),
                                child: Text(
                                  'level',
                                  style: TextStyle(color: Colors.grey[600]),
                                )),
                            Container(
                                padding: EdgeInsets.fromLTRB(100, 10, 10, 10),
                                child: Text(
                                  'Justification',
                                  style: TextStyle(color: Colors.grey[600]),
                                )),
                            Container(
                                padding: EdgeInsets.fromLTRB(150, 10, 10, 10),
                                child: Text(
                                  'View file',
                                  style: TextStyle(color: Colors.grey[600]),
                                )),
                            
                          ],
                        )*/
                        SliverList(
                            delegate: SliverChildBuilderDelegate(
                          (BuildContext context, index) {
                            return Container(
                              child: new Card(
                                  elevation: 5.0,
                                  margin:
                                      EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          child: SizedBox(
                                            width: 150,
                                            child: Text(
                                              'Safety Organization and Line Management Policy',
                                              style: TextStyle(
                                                color: Colors.red[700],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(children: [
                                              SizedBox(width: 70),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  '0',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 105),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.15,
                                                  child: Text(
                                                    'Justification',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 70),
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.15,
                                                  child: Text(
                                                    'NIL',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                          ],
                                        )
                                      ])),
                            );
                          },
                          childCount: 1,
                        )),
                        SliverAppBar(
                          title: (provider.assessmentType == 'self')
                              ? Text("Self Assessment Fire")
                              : Text('Site Assessment Fire'),
                          expandedHeight: 70.0,
                          pinned: false,
                          floating: false,
                          flexibleSpace: FlexibleSpaceBar(),
                        ),
                        SliverList(
                            delegate: SliverChildBuilderDelegate(
                          (BuildContext context, index) {
                            return Container(
                              child: new Card(
                                elevation: 5.0,
                                margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Statement:' +
                                                  provider.listOfStatementFire[
                                                      index]['statement']),
                                              Text('Response:' +
                                                  provider.listOfFireAssessment[
                                                          index]['answer']
                                                      .toString()),
                                              Text('Justification:' +
                                                  provider.listOfFireAssessment[
                                                      index]['comment']),
                                            ])),
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: provider.listOfFireAssessment.length,
                        )),
                        SliverAppBar(
                          title: (provider.assessmentType == 'self')
                              ? Text("Self Assessment office")
                              : Text('Site Assessment office'),
                          expandedHeight: 70.0,
                          pinned: false,
                          floating: false,
                          flexibleSpace: FlexibleSpaceBar(),
                        ),
                        SliverList(
                            delegate: SliverChildBuilderDelegate(
                          (BuildContext context, index) {
                            return Container(
                              child: new Card(
                                elevation: 5.0,
                                margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text('Statement:' +
                                                  provider.listOfStatementOffice[
                                                      index]['statement']),
                                              Text('Response' +
                                                  provider
                                                      .listOfOfficeAssessment[
                                                          index]
                                                      .toString()),
                                            ])),
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: provider.listOfOfficeAssessment.length,
                        )),
                      ],
                    )),
                    (provider.assessmentType != 'self')
                        ? RaisedButton(
                            child: Text('Close Assessment'),
                            onPressed: () async {
                              await Firestore.instance
                                  .collection('cycles')
                                  .document(widget.documentId)
                                  .updateData({'currentStatus': 'Closed'});
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          Dashboard()));
                            })
                        : SizedBox(),
                  ],
                )),
          ),
        ]));
  }
}
