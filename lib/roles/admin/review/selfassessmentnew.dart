/*import 'package:activities/assessment/assessmentProvider.dart';
import 'package:activities/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelfAssessment extends StatefulWidget {
  @override
  _SelfAssessmentState createState() => _SelfAssessmentState();
}

class _SelfAssessmentState extends State<SelfAssessment> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AssessmentProvider>(context);
    return provider.loading
        ? Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            body: Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
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
                          SliverList(
                              delegate: SliverChildBuilderDelegate(
                            (BuildContext context, index) {
                              return Container(
                                child: new Card(
                                  elevation: 5.0,
                                  margin:
                                      EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.fromLTRB(
                                              120,10,120, 10),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Statement:' +
                                                      provider.listOfStatement[
                                                          index]['statement'],
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(height: 20),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text('Marks:' +
                                                        provider
                                                            .listOfAssessment[
                                                                index]['answer']
                                                            .toString()),
                                                            SizedBox(width: 70),
                                                    Text('Level:' +
                                                        provider.listOfAssessment[
                                                            index]['level']),
                                                  ],
                                                ),
                                                SizedBox(height: 20),
                                                Text('Justification:' +
                                                    provider.listOfAssessment[
                                                        index]['comment']),
                                                SizedBox(height: 20),
                                                Text('FileUrl:' +
                                                    provider
                                                        .listOfAssessment[index]
                                                            ['fileUrl']
                                                        .toString()),
                                              ])),
                                    ],
                                  ),
                                ),
                              );
                            },
                            childCount: provider.listOfAssessment.length,
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
                                  margin:
                                      EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.fromLTRB(
                                              120, 10, 120, 10),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Statement:' +
                                                    provider.listOfStatementFire[
                                                        index]['statement'],style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),),
                                                          SizedBox(height: 20),
                                                        
                                                Text('Marks:' +
                                                    provider
                                                        .listOfFireAssessment[
                                                            index]['answer']
                                                        .toString()),
                                                        SizedBox(height: 20),
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
                                  margin:
                                      EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.fromLTRB(
                                              120, 10, 120, 10),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Statement:' +
                                                    provider.listOfStatementOffice[
                                                        index]['statement'],style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),),
                                                          SizedBox(height:20),
                                                Text(provider
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
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Dashboard()));
                              })
                          : SizedBox(),
                    ],
                  )),
            ]),
          ));
  }
}*/
