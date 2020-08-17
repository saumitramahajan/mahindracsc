import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentFireSingle.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentOfficeSingle.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentSingle.dart';
import 'package:provider/provider.dart';

import 'FireAssessment.dart';

class BeforeSubmitSecond extends StatefulWidget {
  @override
  _BeforeSubmitSecondState createState() => _BeforeSubmitSecondState();
}

class _BeforeSubmitSecondState extends State<BeforeSubmitSecond> {
  @override
  Widget build(BuildContext context) {
    final assessmentProvider = Provider.of<SiteAssessmentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Assessment'),
      ),
      body: Container(
          child: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: Text('Fire Assessment'),
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  textTheme: TextTheme(
                      headline6:
                          TextStyle(color: Colors.black, fontSize: 25.0)),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          assessmentProvider.beforeSubmitTapped(
                              index + 1, 'fire');
                          print('From BeforeSubmit:: ' +
                              index.toString() +
                              '\n\n');
                          await Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return ChangeNotifierProvider.value(
                              value: assessmentProvider,
                              child: SiteAssessmentFireSingleForm(),
                            );
                          }));
                          setState(() {});
                        },
                        child: Card(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(assessmentProvider.fireQuestions[index]
                                ['statement']),
                            Text('Selected Assessment: ' +
                                assessmentProvider.fireanswers[index]['answer']
                                    .toString())
                          ],
                        )),
                      );
                    },
                    childCount: 9,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                ),
                SliverAppBar(
                  pinned: true,
                  title: Text('Office Safety Assessment'),
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  textTheme: TextTheme(
                      headline6:
                          TextStyle(color: Colors.black, fontSize: 25.0)),
                ),
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () async {
                          assessmentProvider.beforeSubmitTapped(
                              index + 1, 'office');
                          print('From BeforeSubmit:: ' +
                              index.toString() +
                              '\n\n');
                          await Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return ChangeNotifierProvider.value(
                              value: assessmentProvider,
                              child: SiteAssessmentOfficeSingleForm(),
                            );
                          }));
                          setState(() {});
                        },
                        child: Card(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(assessmentProvider.officeQuestions[index]
                                ['statement']),
                            Text('Selected Assessment: ' +
                                assessmentProvider.officeAnswers[index]
                                    .toString())
                          ],
                        )),
                      );
                    },
                    childCount: 10,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                )
              ],
            ),
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () {},
          )
        ],
      )),
    );
  }
}
