import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:provider/provider.dart';

class SiteAssessmentOfficeSingleForm extends StatefulWidget {
  final sliderValue;
  SiteAssessmentOfficeSingleForm({Key key, this.sliderValue}) : super(key: key);

  @override
  _SiteAssessmentOfficeSingleFormState createState() =>
      _SiteAssessmentOfficeSingleFormState();
}

class _SiteAssessmentOfficeSingleFormState
    extends State<SiteAssessmentOfficeSingleForm> {
  bool answer = false;

  @override
  Widget build(BuildContext context) {
    final assessmentProvider = Provider.of<SiteAssessmentProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Assessment')),
      body: Container(
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
            RaisedButton(
              child: Text('Done'),
              onPressed: () {
                assessmentProvider.setOfficeAssessment(answer);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
