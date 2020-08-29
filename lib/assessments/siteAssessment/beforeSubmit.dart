import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/FireAssessment.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentSingle.dart';
import 'package:mahindraCSC/roles/assessee/assesseeDashboard.dart';
import 'package:provider/provider.dart';

class BeforeSubmit extends StatefulWidget {
  @override
  _BeforeSubmitState createState() => _BeforeSubmitState();
}

class _BeforeSubmitState extends State<BeforeSubmit> {
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
                  title: Text('Assessment Total: ' +
                      assessmentProvider.assessmentTotal.toString() +
                      '/400'),
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
                              index + 1, 'assessment');
                          print('From BeforeSubmit:: ' +
                              index.toString() +
                              '\n\n');
                          await Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return ChangeNotifierProvider.value(
                              value: assessmentProvider,
                              child: SiteAssessmentSingleForm(
                                marks: assessmentProvider
                                    .assessmentAnswers[index]['answer'],
                                comment: assessmentProvider
                                    .assessmentAnswers[index]['comment'],
                                level: assessmentProvider
                                    .assessmentAnswers[index]['level'],
                              ),
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
                            Text(assessmentProvider.questionList[index]
                                ['statement']),
                            Text(assessmentProvider.assessmentAnswers[index]
                                    ['level']
                                .toString())
                          ],
                        )),
                      );
                    },
                    childCount: 25,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                )
              ],
            ),
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: () async {
              if (assessmentProvider.assessmentType == 'site') {
                await assessmentProvider.uploadSiteAssessment();
              } else {
                assessmentProvider.uploadSelfAssessment();
              }
              assessmentProvider.getFireQuestions();
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return ChangeNotifierProvider.value(
                    value: assessmentProvider,
                    child: FireAssessment(),
                  );
                },
              ));
            },
          )
        ],
      )),
    );
  }
}
