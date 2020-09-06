import 'assessmentProvider.dart';
import 'dashboard.dart';
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
                                                  provider.listOfStatement[
                                                      index]['statement']),
                                              Text('Marks:' +
                                                  provider
                                                      .listOfAssessment[index]
                                                          ['answer']
                                                      .toString()),
                                              Text('Justification:' +
                                                  provider.listOfAssessment[
                                                      index]['comment']),
                                              Text('FileUrl:' +
                                                  provider
                                                      .listOfAssessment[index]
                                                          ['fileUrl']
                                                      .toString()),
                                              Text('Level:' +
                                                  provider.listOfAssessment[
                                                      index]['level']),
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
                                              Text('Marks:' +
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
                                              Text(provider
                                                  .listOfOfficeAssessment[index]
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
          ),
        ]));
  }
}
