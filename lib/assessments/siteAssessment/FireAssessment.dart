import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/officeAssessment.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:provider/provider.dart';

class FireAssessment extends StatefulWidget {
  @override
  _FireAssessmentState createState() => _FireAssessmentState();
}

class _FireAssessmentState extends State<FireAssessment> {
  List<Map<String, dynamic>> answers =
      List.generate(9, (index) => {'answer': false, 'comment': ''});

  @override
  Widget build(BuildContext context) {
    final assessmentProvider = Provider.of<SiteAssessmentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Fire Safety Assessment'),
      ),
      body: assessmentProvider.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: assessmentProvider.fireQuestions.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                (index != 0)
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.075,
                                      )
                                    : SizedBox(),
                                Card(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                            assessmentProvider
                                                    .fireQuestions[index]
                                                ['statement'],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(assessmentProvider
                                                .fireQuestions[index]
                                            ['validation']),
                                        Row(
                                          children: [
                                            Radio(
                                                value: true,
                                                groupValue: answers[index]
                                                    ['answer'],
                                                onChanged: (v) {
                                                  setState(() {
                                                    answers[index]['answer'] =
                                                        true;
                                                  });
                                                }),
                                            Text('Yes')
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                                value: false,
                                                groupValue: answers[index]
                                                    ['answer'],
                                                onChanged: (v) {
                                                  setState(() {
                                                    answers[index]['answer'] =
                                                        false;
                                                  });
                                                }),
                                            Text('No')
                                          ],
                                        ),
                                        (answers[index]['answer'] &&
                                                assessmentProvider
                                                            .currentQuestion[
                                                        'condition'] !=
                                                    'null')
                                            ? Text(assessmentProvider
                                                .currentQuestion['condition'])
                                            : SizedBox(),
                                        (answers[index]['answer'] &&
                                                assessmentProvider
                                                            .currentQuestion[
                                                        'condition'] !=
                                                    'null')
                                            ? TextField(
                                                onChanged: (v) {
                                                  answers[index]['comment'] = v;
                                                },
                                                decoration: InputDecoration(
                                                    labelText: 'Comment'),
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      RaisedButton(
                        child: Text('Next'),
                        onPressed: () {
                          assessmentProvider.setFireAssessment(answers);
                          assessmentProvider.getOfficeQuestions();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return ChangeNotifierProvider.value(
                                value: assessmentProvider,
                                child: OfficeAssessment(),
                              );
                            },
                          ));
                        },
                      )
                    ],
                  )),
            ),
    );
  }
}
