import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/fireSafetyManagementProfile.dart';
import 'package:mahindraCSC/assessments/siteAssessment/officeAssessment.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:provider/provider.dart';

class FireAssessment extends StatefulWidget {
  @override
  _FireAssessmentState createState() => _FireAssessmentState();
}

class _FireAssessmentState extends State<FireAssessment> {
  List<int> marks = [0, 5, 10, 10, 10, 20, 10, 20, 15];
  List<Map<String, dynamic>> answers =
      List.generate(9, (index) => {'answer': 'no', 'comment': '', 'marks': 0});

  @override
  Widget build(BuildContext context) {
    final assessmentProvider = Provider.of<SiteAssessmentProvider>(context);
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
                                (index == 0 || answers[0]['answer'] != 'no')
                                    ? Card(
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
                                              Text('(Guidance: ' +
                                                  assessmentProvider
                                                          .fireQuestions[index]
                                                      ['validation'] +
                                                  ')'),
                                              Row(
                                                children: [
                                                  Radio(
                                                      value: 'yes',
                                                      groupValue: answers[index]
                                                          ['answer'],
                                                      onChanged: (v) {
                                                        setState(() {
                                                          answers[index]
                                                                  ['answer'] =
                                                              'yes';
                                                        });
                                                      }),
                                                  Text('Yes')
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Radio(
                                                      value: 'partial',
                                                      groupValue: answers[index]
                                                          ['answer'],
                                                      onChanged: (v) {
                                                        setState(() {
                                                          answers[index]
                                                                  ['answer'] =
                                                              'partial';
                                                        });
                                                      }),
                                                  Text('Partially Completed')
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Radio(
                                                      value: 'no',
                                                      groupValue: answers[index]
                                                          ['answer'],
                                                      onChanged: (v) {
                                                        setState(() {
                                                          answers[index]
                                                              ['answer'] = 'no';
                                                        });
                                                      }),
                                                  Text('No')
                                                ],
                                              ),
                                              (answers[index]['answer'] !=
                                                          'no' &&
                                                      assessmentProvider
                                                                      .fireQuestions[
                                                                  index]
                                                              ['condition'] !=
                                                          'null')
                                                  ? Text(assessmentProvider
                                                          .fireQuestions[index]
                                                      ['condition'])
                                                  : SizedBox(),
                                              (answers[index]['answer'] !=
                                                          'no' &&
                                                      assessmentProvider
                                                                  .fireQuestions[
                                                              index]['condition'] !=
                                                          'null')
                                                  ? TextField(
                                                      onChanged: (v) {
                                                        answers[index]
                                                            ['comment'] = v;
                                                      },
                                                      decoration:
                                                          InputDecoration(
                                                              labelText:
                                                                  'Comment'),
                                                    )
                                                  : SizedBox(),
                                              (assessmentProvider
                                                              .assessmentType ==
                                                          'site' &&
                                                      index > 0)
                                                  ? TextField(
                                                      decoration: InputDecoration(
                                                          labelText:
                                                              'Enter marks out of ${marks[index].toString()}'),
                                                      onChanged: (value) {
                                                        answers[index]
                                                            ['marks'] = value;
                                                      },
                                                      keyboardType: TextInputType
                                                          .numberWithOptions(
                                                              decimal: true),
                                                    )
                                                  : SizedBox(),
                                            ],
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              ],
                            );
                          },
                        ),
                      ),
                      RaisedButton(
                        child: Text('Upload Supporting Documents'),
                        onPressed: () {},
                      ),
                      RaisedButton(
                        child: Text('Next'),
                        onPressed: () async {
                          assessmentProvider.setFireAssessment(answers);
                          assessmentProvider.getOfficeQuestions();
                          await Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) {
                              return FireSafetyRiskProfile(
                                  cycleId: assessmentProvider.cycleId);
                            },
                          ));
                          await Navigator.of(context).push(MaterialPageRoute(
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
