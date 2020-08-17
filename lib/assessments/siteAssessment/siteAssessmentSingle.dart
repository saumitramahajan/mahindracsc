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
    return Scaffold(
      appBar: AppBar(title: Text('Assessment')),
      body: Container(
        child: Column(
          children: [
            Text(assessmentProvider.currentQuestion['statement']),
            Slider(
                min: 0,
                max: (assessmentProvider.currentQuestion['marks']).toDouble(),
                divisions: assessmentProvider.currentQuestion['marks'] * 2,
                label: '$_sliderValue',
                value: _sliderValue,
                onChanged: (newValue) {
                  setState(() {
                    _sliderValue = newValue;
                    level = getLevelString(_sliderValue, assessmentProvider);
                    content =
                        getContentString(_sliderValue, assessmentProvider);
                  });
                }),
            Text('Assessment Marks: ' + _sliderValue.toString()),
            Text(level),
            Text(content),
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Comment'),
            ),
            RaisedButton(
              child: Text('Done'),
              onPressed: () {
                assessmentProvider.submited(_sliderValue, _controller.text);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
