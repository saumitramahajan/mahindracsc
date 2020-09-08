//import 'dart:html';

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
  TextEditingController _justificationController = TextEditingController();
  TextEditingController _marksController = TextEditingController(text: '0');
  TextEditingController _suggestionController = TextEditingController();
  //File file;
  String level = '0';

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
        automaticallyImplyLeading: false,
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
                        (assessmentProvider.i < 25)
                            ? Text(
                                'Process:' +
                                    assessmentProvider
                                        .currentQuestion['statement'],
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              )
                            : Text(
                                'Result:' +
                                    assessmentProvider
                                        .currentQuestion['statement'],
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
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
                                height:
                                    MediaQuery.of(context).size.height * .05,
                              )
                            : SizedBox(),
                        (assessmentProvider.assessmentType == 'site')
                            ? TextField(
                                controller: _marksController,
                                decoration:
                                    InputDecoration(labelText: 'Enter Marks'),
                              )
                            : SizedBox(),
                        TextField(
                          controller: _justificationController,
                          decoration: InputDecoration(
                              labelText:
                                  (assessmentProvider.assessmentType == 'site')
                                      ? 'Observations'
                                      : 'Justification'),
                        ),
                        (assessmentProvider.assessmentType == 'site')
                            ? TextField(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            (assessmentProvider.i > 1)
                                ? RaisedButton(
                                    child: Text('Previous'),
                                    onPressed: () {
                                      setState(() {
                                        Map<String, dynamic> map =
                                            assessmentProvider
                                                .previousPressed();
                                        _marksController.text =
                                            map['value'].toString();
                                        level = map['level'];
                                        _justificationController.text =
                                            map['comment'];
                                        _suggestionController.text =
                                            map['suggestion'];
                                      });
                                    },
                                  )
                                : SizedBox(),
                            (assessmentProvider.i < 33)
                                ? RaisedButton(
                                    child: Text('Next'),
                                    onPressed: () {
                                      setState(() {
                                        Map<String, dynamic> map =
                                            assessmentProvider.setAssessment(
                                                value: (assessmentProvider
                                                            .assessmentType ==
                                                        'site')
                                                    ? 0
                                                    : double.parse(
                                                        _marksController.text),
                                                comment:
                                                    _justificationController
                                                        .text,
                                                level: level,
                                                suggestion:
                                                    _suggestionController.text);
                                        _marksController.text =
                                            map['value'].toString();
                                        level = map['level'];
                                        _justificationController.text =
                                            map['comment'];
                                        _suggestionController.text =
                                            map['suggestion'];
                                      });
                                    })
                                : RaisedButton(
                                    child: Text('Submit'),
                                    onPressed: () async {
                                      assessmentProvider.submited(
                                          value: (assessmentProvider
                                                      .assessmentType ==
                                                  'site')
                                              ? 0
                                              : double.parse(
                                                  _marksController.text),
                                          comment:
                                              _justificationController.text,
                                          level: level,
                                          suggestion:
                                              _suggestionController.text);
                                      await Navigator.of(context)
                                          .push(MaterialPageRoute(builder: (_) {
                                        return ChangeNotifierProvider.value(
                                          value: assessmentProvider,
                                          child: BeforeSubmit(),
                                        );
                                      }));
                                      Navigator.of(context).pop();
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
