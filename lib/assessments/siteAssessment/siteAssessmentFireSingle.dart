import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:provider/provider.dart';

class SiteAssessmentFireSingleForm extends StatefulWidget {
  final sliderValue;
  SiteAssessmentFireSingleForm({Key key, this.sliderValue}) : super(key: key);

  @override
  _SiteAssessmentFireSingleFormState createState() =>
      _SiteAssessmentFireSingleFormState();
}

class _SiteAssessmentFireSingleFormState
    extends State<SiteAssessmentFireSingleForm> {
  bool answer = false;
  TextEditingController _controller = TextEditingController();

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
            (answer &&
                    assessmentProvider.currentQuestion['condition'] != 'null')
                ? Text(assessmentProvider.currentQuestion['condition'])
                : SizedBox(),
            (answer &&
                    assessmentProvider.currentQuestion['condition'] != 'null')
                ? TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: 'Comment'),
                  )
                : SizedBox(),
            RaisedButton(
              child: Text('Done'),
              onPressed: () {
                assessmentProvider.setFireAssessment(answer, _controller.text);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
