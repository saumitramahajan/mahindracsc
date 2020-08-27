import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:provider/provider.dart';

class SiteAssessmentSingleForm extends StatefulWidget {
  final sliderValue;
  SiteAssessmentSingleForm({Key key, this.sliderValue}) : super(key: key);

  @override
  _SiteAssessmentSingleFormState createState() =>
      _SiteAssessmentSingleFormState();
}

class _SiteAssessmentSingleFormState extends State<SiteAssessmentSingleForm> {
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
  void initState() {
    super.initState();
    _sliderValue = widget.sliderValue;
  }

  @override
  Widget build(BuildContext context) {
    final assessmentProvider = Provider.of<SiteAssessmentProvider>(context);
    TextEditingController _marksController = TextEditingController();
    TextEditingController _justificationController = TextEditingController();
    return Scaffold(
        appBar: AppBar(title: Text('Assessment')),
        body: Container(
            child: Column(children: [
          SingleChildScrollView(
              child: Row(children: [
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
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .05,
                  ),
                  Image.network(
                    assessmentProvider.currentQuestion['imageLink'],
                  ),
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
                  (assessmentProvider.assessmentType == 'site')
                      ? SizedBox(
                          height: MediaQuery.of(context).size.height * .05,
                        )
                      : SizedBox(),
                  (assessmentProvider.assessmentType == 'site')
                      ? TextField(
                          controller: _marksController,
                          decoration: InputDecoration(labelText: 'Enter Marks'),
                        )
                      : SizedBox(),
                  TextField(
                    controller: _justificationController,
                    decoration: InputDecoration(labelText: 'Justification'),
                  ),
                  RaisedButton(
                    child: Text('Upload Supporting document'),
                    onPressed: () async {
                      //file = await FilePicker.getFile();
                    },
                  ),
                  RaisedButton(
                    child: Text('Done'),
                    onPressed: () {
                      assessmentProvider.submited(
                          value: (assessmentProvider.assessmentType == 'site')
                              ? 0
                              : double.parse(_marksController.text),
                          comment: _justificationController.text,
                          level: level);
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          ]))
        ])));
  }
}
