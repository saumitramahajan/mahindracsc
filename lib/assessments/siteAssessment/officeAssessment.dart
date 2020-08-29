import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:mahindraCSC/roles/assessee/assesseeDashboard.dart';
import 'package:mahindraCSC/roles/assessor/assessorDashboard.dart';
import 'package:provider/provider.dart';

class OfficeAssessment extends StatefulWidget {
  @override
  _OfficeAssessmentState createState() => _OfficeAssessmentState();
}

class _OfficeAssessmentState extends State<OfficeAssessment> {
  List<bool> answers = List.generate(10, (index) => false);
  @override
  Widget build(BuildContext context) {
    final assessmentProvider = Provider.of<SiteAssessmentProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Office Safety Assessment'),
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
                                            )),
                                        Text(assessmentProvider
                                                .officeQuestions[index]
                                            ['validation']),
                                        Row(
                                          children: [
                                            Radio(
                                                value: true,
                                                groupValue: answers[index],
                                                onChanged: (v) {
                                                  setState(() {
                                                    answers[index] = true;
                                                  });
                                                }),
                                            Text('Yes')
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                                value: false,
                                                groupValue: answers[index],
                                                onChanged: (v) {
                                                  setState(() {
                                                    answers[index] = false;
                                                  });
                                                }),
                                            Text('No')
                                          ],
                                        ),
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
