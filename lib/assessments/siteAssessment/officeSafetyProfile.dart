import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OfficeSafetyRiskProfile extends StatefulWidget {
  final String cycleId;
  OfficeSafetyRiskProfile({Key key, @required this.cycleId}) : super(key: key);
  @override
  _OfficeSafetyRiskProfile createState() => _OfficeSafetyRiskProfile();
}

class _OfficeSafetyRiskProfile extends State<OfficeSafetyRiskProfile> {
  bool loading = false;
  TextEditingController _positiveP1 = TextEditingController();
  TextEditingController _positiveP2 = TextEditingController();
  TextEditingController _positiveP3 = TextEditingController();
  TextEditingController _seriousP1 = TextEditingController();
  TextEditingController _seriousP2 = TextEditingController();
  TextEditingController _seriousP3 = TextEditingController();
  TextEditingController _suggestionP1 = TextEditingController();
  TextEditingController _suggestionP2 = TextEditingController();
  TextEditingController _suggestionP3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
        ),
        body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Office Safety Risk Profile',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      ),
                                    ],
                                  ),
                                  Text(
                                      'Positive Observation Specific to office Safety Risk Profile '),
                                  TextField(
                                    controller: _positiveP1,
                                    decoration:
                                        InputDecoration(labelText: '1.'),
                                  ),
                                  TextField(
                                    controller: _positiveP2,
                                    decoration:
                                        InputDecoration(labelText: '2.'),
                                  ),
                                  TextField(
                                    controller: _positiveP3,
                                    decoration:
                                        InputDecoration(labelText: '3.'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Serious Non-Conformity Specific to office Safety Risk Profile'),
                                  TextField(
                                    controller: _seriousP1,
                                    decoration:
                                        InputDecoration(labelText: '1.'),
                                  ),
                                  TextField(
                                    controller: _seriousP2,
                                    decoration:
                                        InputDecoration(labelText: '2.'),
                                  ),
                                  TextField(
                                    controller: _seriousP3,
                                    decoration:
                                        InputDecoration(labelText: '3.'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Suggestion For Improvement Specific to Office Safety Risk Profile'),
                                  TextField(
                                    controller: _suggestionP1,
                                    decoration:
                                        InputDecoration(labelText: '1.'),
                                  ),
                                  TextField(
                                    controller: _suggestionP2,
                                    decoration:
                                        InputDecoration(labelText: '2.'),
                                  ),
                                  TextField(
                                    controller: _suggestionP3,
                                    decoration:
                                        InputDecoration(labelText: '3.'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        RaisedButton(
                            child: loading
                                ? CircularProgressIndicator()
                                : Text('Next'),
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });
                              List<Map<String, String>> siteRiskProfile = [];
                              Map<String, String> positive = {
                                'point1': _positiveP1.text,
                                'point2': _positiveP2.text,
                                'point3': _positiveP3.text,
                              };
                              siteRiskProfile.add(positive);
                              Map<String, String> serious = {
                                'point1': _seriousP1.text,
                                'point2': _seriousP2.text,
                                'point3': _seriousP3.text,
                              };
                              siteRiskProfile.add(serious);
                              Map<String, String> suggestion = {
                                'point1': _suggestionP1.text,
                                'point2': _suggestionP2.text,
                                'point3': _suggestionP3.text,
                              };
                              siteRiskProfile.add(suggestion);
                              await Firestore.instance
                                  .collection('cycles')
                                  .document(widget.cycleId)
                                  .updateData(
                                      {'officeRiskProfile': siteRiskProfile});
                              Navigator.of(context).pop();
                            })
                      ],
                    ),
                  ))
            ]));
  }
}
