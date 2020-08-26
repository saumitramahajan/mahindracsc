//import 'dart:html';
import 'dart:io';
import 'package:file_picker/file_picker.dart' as mob;
//import 'package:file_picker_web/file_picker_web.dart';
import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/beforeSubmit.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:provider/provider.dart';

class SiteAssessmentForm extends StatefulWidget {
  @override
  _SiteAssessmentFormState createState() => _SiteAssessmentFormState();
}

class _SiteAssessmentFormState extends State<SiteAssessmentForm> {
  double _sliderValue = 0;
  TextEditingController _controller = TextEditingController();
  File file;
  String level = '0';

  @override
  Widget build(BuildContext context) {
    final assessmentProvider = Provider.of<SiteAssessmentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Assessment'),
      ),
      body: assessmentProvider.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .15,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .1,
                        ),
                        Text(
                          'Statement:' +
                              assessmentProvider.currentQuestion['statement'],
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        Image.network(
                          assessmentProvider.currentQuestion['imageLink'],
                        ),
                        (assessmentProvider.assessmentType == 'site')
                            ? SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .05,
                              )
                            : SizedBox(),
                        (assessmentProvider.assessmentType == 'site')
                            ? TextField()
                            : SizedBox(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        ),
                        Text('Select Level:'),
                        RadioListTile(
                            title: Text('Level 1'),
                            value: '1',
                            groupValue: level,
                            onChanged: (String value) {
                              setState(() {
                                level = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('Level 2'),
                            value: '2',
                            groupValue: level,
                            onChanged: (String value) {
                              setState(() {
                                level = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('Level 3'),
                            value: '3',
                            groupValue: level,
                            onChanged: (String value) {
                              setState(() {
                                level = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('Level 4'),
                            value: '4',
                            groupValue: level,
                            onChanged: (String value) {
                              setState(() {
                                level = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('Level 5'),
                            value: '5',
                            groupValue: level,
                            onChanged: (String value) {
                              setState(() {
                                level = value;
                              });
                            }),
                        TextField(
                          controller: _controller,
                          decoration:
                              InputDecoration(labelText: 'Justification'),
                        ),
                        RaisedButton(
                          child: Text('Upload Supporting document'),
                          onPressed: () async {
                            file = await mob.FilePicker.getFile();
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            (assessmentProvider.i > 1)
                                ? RaisedButton(
                                    child: Text('Previous'),
                                    onPressed: () {
                                      setState(() {
                                        _sliderValue = assessmentProvider
                                            .previousPressed();

                                        _controller.text = assessmentProvider
                                                    .assessmentAnswers[
                                                assessmentProvider.i - 1]
                                            ['comment'];
                                      });
                                    },
                                  )
                                : SizedBox(),
                            (assessmentProvider.i < 25)
                                ? RaisedButton(
                                    child: Text('Next'),
                                    onPressed: () {
                                      setState(() {
                                        _sliderValue =
                                            assessmentProvider.setAssessment(
                                                _sliderValue, _controller.text);
                                      });
                                    })
                                : RaisedButton(
                                    child: Text('Submit'),
                                    onPressed: () {
                                      assessmentProvider.submited(
                                          _sliderValue, _controller.text);
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (_) {
                                        return ChangeNotifierProvider.value(
                                          value: assessmentProvider,
                                          child: BeforeSubmit(),
                                        );
                                      }));
                                    },
                                  ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
