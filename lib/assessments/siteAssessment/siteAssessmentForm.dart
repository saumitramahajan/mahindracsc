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
  String level = '';
  String content = '';
  TextEditingController _controller = TextEditingController();

  String getLevelString(double value, SiteAssessmentProvider provider) {
    if (value < provider.currentQuestion['scheme'][0]['end']) {
      return provider.currentQuestion['scheme'][0]['name'];
    } else if (value < provider.currentQuestion['scheme'][1]['end']) {
      return provider.currentQuestion['scheme'][1]['name'];
    } else if (value < provider.currentQuestion['scheme'][2]['end']) {
      return provider.currentQuestion['scheme'][2]['name'];
    } else if (value < provider.currentQuestion['scheme'][3]['end']) {
      return provider.currentQuestion['scheme'][3]['name'];
    } else {
      return provider.currentQuestion['scheme'][4]['name'];
    }
  }

  String getContentString(double value, SiteAssessmentProvider provider) {
    if (value < provider.currentQuestion['scheme'][0]['end']) {
      return provider.currentQuestion['scheme'][0]['content'];
    } else if (value < provider.currentQuestion['scheme'][1]['end']) {
      return provider.currentQuestion['scheme'][1]['content'];
    } else if (value < provider.currentQuestion['scheme'][2]['end']) {
      return provider.currentQuestion['scheme'][2]['content'];
    } else if (value < provider.currentQuestion['scheme'][3]['end']) {
      return provider.currentQuestion['scheme'][3]['content'];
    } else {
      return provider.currentQuestion['scheme'][4]['content'];
    }
  }

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
          : Container(
              child: Column(
                children: [
                  Text(assessmentProvider.currentQuestion['statement']),
                  Slider(
                      min: 0,
                      max: (assessmentProvider.currentQuestion['marks'])
                          .toDouble(),
                      divisions:
                          assessmentProvider.currentQuestion['marks'] * 2,
                      label: '$_sliderValue',
                      value: _sliderValue,
                      onChanged: (newValue) {
                        setState(() {
                          _sliderValue = newValue;
                          level =
                              getLevelString(_sliderValue, assessmentProvider);
                          content = getContentString(
                              _sliderValue, assessmentProvider);
                        });
                      }),
                  Text('Assessment Marks: ' + _sliderValue.toString()),
                  Text(level),
                  Text(content),
                  (_sliderValue > 0)
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
                                  _sliderValue =
                                      assessmentProvider.previousPressed();
                                  level = getLevelString(
                                      _sliderValue, assessmentProvider);
                                  content = getContentString(
                                      _sliderValue, assessmentProvider);
                                  _controller.text =
                                      assessmentProvider.assessmentAnswers[
                                          assessmentProvider.i - 1]['comment'];
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
                                  if (_sliderValue > 0) {
                                    level = getLevelString(
                                        _sliderValue, assessmentProvider);
                                    content = getContentString(
                                        _sliderValue, assessmentProvider);
                                  } else {
                                    level = '';
                                    content = '';
                                    _controller.clear();
                                  }
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
    );
  }
}
