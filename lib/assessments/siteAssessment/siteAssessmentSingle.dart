import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:provider/provider.dart';

class SiteAssessmentSingleForm extends StatefulWidget {
  final marks;
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
  TextEditingController _marksController = TextEditingController();
  TextEditingController _justificationController = TextEditingController();

  @override
  void initState() {
    _marksController.text = widget.marks;
    _justificationController.text = widget.comment;
    level = widget.level;
    super.initState();
  }

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
                            decoration:
                                InputDecoration(labelText: 'Enter Marks'),
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
          ])),
        ));
  }
}
