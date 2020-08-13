import 'package:flutter/material.dart';
import 'package:mahindraCSC/roles/assessor/assessorDashboard.dart';
import 'package:mahindraCSC/roles/assessor/assessorProvider.dart';
import 'package:provider/provider.dart';
import 'package:mahindraCSC/roles/assessee/assesseeProvider.dart';
import 'package:mahindraCSC/roles/assessee/assesseeDashboard.dart';

class Choice extends StatefulWidget {
  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  void assesseePressed() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return ChangeNotifierProvider<AssesseeProvider>(
        create: (_) => AssesseeProvider(),
        child: AssesseeDashboard(),
      );
    }));
  }

  void assessorPressed() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return ChangeNotifierProvider<AssessorProvider>(
        create: (_) => AssessorProvider(),
        child: AssessorDashboard(),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Role Selection'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Please select the role you would like to proceed with:'),
              RaisedButton(
                onPressed: assessorPressed,
                child: Text('Assessor'),
              ),
              RaisedButton(
                onPressed: assesseePressed,
                child: Text('Assessee'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
