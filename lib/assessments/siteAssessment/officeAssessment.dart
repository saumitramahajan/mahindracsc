import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/officeSafetyProfile.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:mahindraCSC/assessments/siteAssessment/summaryOfRiskProfile.dart';
import 'package:mahindraCSC/roles/assessee/assesseeDashboard.dart';
import 'package:mahindraCSC/roles/assessor/assessorDashboard.dart';
import 'package:provider/provider.dart';

class OfficeAssessment extends StatefulWidget {
  @override
  _OfficeAssessmentState createState() => _OfficeAssessmentState();
}

class _OfficeAssessmentState extends State<OfficeAssessment> {
  List<Map<String, dynamic>> answers =
      List.generate(10, (index) => {'answer': 'no', 'marks': 0});
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
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                (index != 0)
                                    ? SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.1,
                                      )
                                    : SizedBox(),
                                Card(
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Text(
                                            assessmentProvider
                                                    .officeQuestions[index]
                                                ['statement'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        Text(assessmentProvider
                                                .officeQuestions[index]
                                            ['validation']),
                                        Row(
                                          children: [
                                            Radio(
                                                value: 'yes',
                                                groupValue: answers[index]
                                                    ['answer'],
                                                onChanged: (v) {
                                                  setState(() {
                                                    answers[index]['answer'] =
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
                                                    answers[index]['answer'] =
                                                        'partial';
                                                  });
                                                }),
                                            Text('Partially Complete')
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
                                                    answers[index]['answer'] =
                                                        'no';
                                                  });
                                                }),
                                            Text('No')
                                          ],
                                        ),
                                        (answers[index]['answer'] &&
                                                assessmentProvider
                                                        .assessmentType ==
                                                    'site')
                                            ? TextField(
                                                decoration: InputDecoration(
                                                    labelText:
                                                        'Enter marks out of 10'),
                                                onChanged: (value) {
                                                  answers[index]['marks'] =
                                                      value;
                                                },
                                                keyboardType: TextInputType
                                                    .numberWithOptions(
                                                        decimal: true),
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
                        child: Text('Submit'),
                        onPressed: () async {
                          await assessmentProvider.setOfficeAssessment(answers);
                          if (assessmentProvider.assessmentType == 'site') {
                            await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return OfficeSafetyRiskProfile(
                                    cycleId: assessmentProvider.cycleId);
                              },
                            ));
                            await Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return SummaryOfRiskProfile(
                                    cycleId: assessmentProvider.cycleId);
                              },
                            ));
                          }
                          if (assessmentProvider.assessmentType == 'site') {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => AssessorDashboard(),
                            ));
                          } else {
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(
                              builder: (context) => AssesseeDashboard(),
                            ));
                          }
                        },
                      )
                    ],
                  ),
                ),
              ));
  }
}
