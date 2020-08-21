import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/beforeSubmitSecond.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:provider/provider.dart';

class OfficeAssessment extends StatefulWidget {
  @override
  _OfficeAssessmentState createState() => _OfficeAssessmentState();
}

class _OfficeAssessmentState extends State<OfficeAssessment> {
  bool answer = false;
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
          : Container(
              child: Column(
                children: [
                  Text(assessmentProvider.currentQuestion['statement'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Text(assessmentProvider.currentQuestion['validation']),
                  Row(
                    children: [
                      Radio(
                          value: true,
                          groupValue: answer,
                          onChanged: (v) {
                            setState(() {
                              answer = true;
                            });
                          }),
                      Text('Yes')
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: false,
                          groupValue: answer,
                          onChanged: (v) {
                            setState(() {
                              answer = false;
                            });
                          }),
                      Text('No')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (assessmentProvider.i > 1)
                          ? RaisedButton(
                              child: Text('Previous'),
                              onPressed: () {
                                setState(() {
                                  assessmentProvider.previousFirePressed();
                                  answer = assessmentProvider.officeAnswers[
                                      (assessmentProvider.i) - 1];
                                });
                              },
                            )
                          : SizedBox(),
                      (assessmentProvider.i < 10)
                          ? RaisedButton(
                              child: Text('Next'),
                              onPressed: () {
                                setState(() {
                                  assessmentProvider
                                      .setOfficeAssessment(answer);

                                  answer =
                                      (assessmentProvider.officeAnswers.length <
                                              assessmentProvider.i - 1)
                                          ? assessmentProvider.officeAnswers[
                                              (assessmentProvider.i) - 1]
                                          : false;
                                });
                              })
                          : RaisedButton(
                              child: Text('Submit'),
                              onPressed: () {
                                assessmentProvider.setOfficeAssessment(answer);
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return ChangeNotifierProvider.value(
                                      value: assessmentProvider,
                                      child: BeforeSubmitSecond(),
                                    );
                                  },
                                ));
                              },
                            ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
