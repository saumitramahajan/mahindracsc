import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
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
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Column(
                            children: [
                              Text(
                                  assessmentProvider.officeQuestions[index]
                                      ['statement'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(assessmentProvider.officeQuestions[index]
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
                        );
                      },
                    ),
                  ),
                  RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      assessmentProvider.setOfficeAssessment(answers);
                    },
                  )
                ],
              ));
  }
}
