import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:provider/provider.dart';

import '../../utilities.dart';

class SiteAssessmentSingleForm extends StatefulWidget {
  final double marks;
  final comment;
  final level;
  SiteAssessmentSingleForm({Key key, this.marks, this.comment, this.level})
      : super(key: key);

  @override
  _SiteAssessmentSingleFormState createState() =>
      _SiteAssessmentSingleFormState();
}

class _SiteAssessmentSingleFormState extends State<SiteAssessmentSingleForm> {
  String level = '';
  TextEditingController _justificationController = TextEditingController();
  TextEditingController _suggestionController = TextEditingController();
  double marks;

  @override
  void initState() {
    marks = widget.marks;
    _justificationController.text = widget.comment;
    level = widget.level;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final assessmentProvider = Provider.of<SiteAssessmentProvider>(context);
    Utilities utilities = Utilities();

    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              backgroundColor: utilities.mainColor,
              titleSpacing: 0.0,
              automaticallyImplyLeading: false,
            ),
            body: SingleChildScrollView(
              child: Container(
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
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
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
                                marks = 0.0;
                              });
                            }),
                        RadioListTile(
                            title: Text('Level 2'),
                            value: '2',
                            groupValue: level,
                            onChanged: (String value) {
                              setState(() {
                                level = value;
                                marks = assessmentProvider
                                        .currentQuestion['levelMarksBase'][0]
                                        .toDouble() +
                                    0.5;
                              });
                            }),
                        RadioListTile(
                            title: Text('Level 3'),
                            value: '3',
                            groupValue: level,
                            onChanged: (String value) {
                              setState(() {
                                level = value;
                                marks = assessmentProvider
                                        .currentQuestion['levelMarksBase'][1]
                                        .toDouble() +
                                    0.5;
                              });
                            }),
                        RadioListTile(
                            title: Text('Level 4'),
                            value: '4',
                            groupValue: level,
                            onChanged: (String value) {
                              setState(() {
                                level = value;
                                marks = assessmentProvider
                                        .currentQuestion['levelMarksBase'][2]
                                        .toDouble() +
                                    0.5;
                              });
                            }),
                        RadioListTile(
                            title: Text('Level 5'),
                            value: '5',
                            groupValue: level,
                            onChanged: (String value) {
                              setState(() {
                                level = value;
                                marks = assessmentProvider
                                        .currentQuestion['levelMarksBase'][3]
                                        .toDouble() +
                                    0.5;
                              });
                            }),
                        (assessmentProvider.assessmentType == 'site')
                            ? SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * .05,
                              )
                            : SizedBox(),
                        (assessmentProvider.assessmentType == 'site')
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  DropdownButton<double>(
                                    items: assessmentProvider
                                            .currentQuestion['levelMarks']
                                        [(int.parse(level)) - 1],
                                    onChanged: (value) {
                                      setState(() {
                                        marks = value;
                                        print(marks);
                                      });
                                    },
                                    value: marks,
                                  ),
                                ],
                              )
                            : SizedBox(),
                        TextField(
                          minLines: 1,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          controller: _justificationController,
                          decoration: InputDecoration(
                              labelText:
                                  (assessmentProvider.assessmentType == 'site')
                                      ? 'Observations'
                                      : 'Justification'),
                        ),
                        (assessmentProvider.assessmentType == 'site')
                            ? TextField(
                                minLines: 1,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                controller: _suggestionController,
                                decoration: InputDecoration(
                                    labelText:
                                        'Suggestions for Moving to Next Level'),
                              )
                            : SizedBox(),
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
                                value: (assessmentProvider.assessmentType ==
                                        'site')
                                    ? marks
                                    : 0,
                                comment: _justificationController.text,
                                suggestion: _suggestionController.text,
                                level: level);
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  ),
                ]))
              ])),
            )),
        SizedBox(
          height: AppBar().preferredSize.height * 2,
          child: Image.asset(
            'assets/mahindraAppBar.png',
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }
}
