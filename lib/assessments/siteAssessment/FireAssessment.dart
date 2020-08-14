import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/officeAssessment.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:mahindraCSC/roles/assessee/assesseeProvider.dart';
import 'package:provider/provider.dart';

class FireAssessment extends StatefulWidget {
  @override
  _FireAssessmentState createState() => _FireAssessmentState();
}

class _FireAssessmentState extends State<FireAssessment> {
  bool answer = false;
  TextEditingController _controller = TextEditingController();
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
                  (answer &&
                          assessmentProvider.currentQuestion['condition'] !=
                              'null')
                      ? Text(assessmentProvider.currentQuestion['condition'])
                      : SizedBox(),
                  (answer &&
                          assessmentProvider.currentQuestion['condition'] !=
                              'null')
                      ? TextField(
                          controller: _controller,
                          decoration: InputDecoration(labelText: 'Comment'),
                        )
                      : SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      (assessmentProvider.i > 1)
                          ? RaisedButton(
                              child: Text('Previous'),
                              onPressed: () {
                                setState(() {
                                  assessmentProvider.previousFirePressed();
                                  answer = assessmentProvider.fireanswers[
                                      (assessmentProvider.i) - 1]['answer'];
                                  _controller.text = assessmentProvider
                                          .fireanswers[
                                      (assessmentProvider.i) - 1]['comment'];
                                });
                              },
                            )
                          : SizedBox(),
                      (assessmentProvider.i < 9)
                          ? RaisedButton(
                              child: Text('Next'),
                              onPressed: () {
                                setState(() {
                                  assessmentProvider.setFireAssessment(
                                      answer, _controller.text);

                                  _controller.text = (assessmentProvider
                                              .fireanswers.length <
                                          assessmentProvider.i - 1)
                                      ? assessmentProvider.fireQuestions[
                                          (assessmentProvider.i) - 1]['comment']
                                      : '';
                                  answer = (assessmentProvider
                                              .fireanswers.length <
                                          assessmentProvider.i - 1)
                                      ? assessmentProvider.fireQuestions[
                                          (assessmentProvider.i) - 1]['answer']
                                      : false;
                                });
                              })
                          : RaisedButton(
                              child: Text('Submit'),
                              onPressed: () {
                                assessmentProvider.setFireAssessment(
                                    answer, _controller.text);
                                assessmentProvider.getOfficeQuestions();
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ChangeNotifierProvider.value(
                                    value: assessmentProvider,
                                    child: OfficeAssessment(),
                                  );
                                }));
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
