import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../assesseeDashboard.dart';
import 'monthly_safety_report.dart';

class MonthlySafetyReportIT extends StatefulWidget {
  final String type;
  final String cycleId;
  final String locationId;
  final String locationName;

  MonthlySafetyReportIT(
      {Key key, this.type, this.cycleId, this.locationId, this.locationName})
      : super(key: key);
  @override
  _MonthlySafetyReportIT createState() => _MonthlySafetyReportIT();
}

class _MonthlySafetyReportIT extends State<MonthlySafetyReportIT> {
  final _formKey = GlobalKey<FormState>();
  double _manpower = 0,
      _fatal = 0,
      _fatalaccidents = 0,
      _reportableaccidents = 0,
      _fireincidentmajor = 0,
      _fireincidentminor = 0;
  Future<void> _onPressedSave() async {
    if (widget.type == 'assessment') {
      firestoreInstance
          .collection("cycles")
          .document(widget.cycleId)
          .updateData({
        "adManPower": _manpower,
        "adFatal": _fatal,
        "adOnDutyFatal": _fatalaccidents,
        "adReportableAccidents": _reportableaccidents,
        "adFireIncidentMajor": _fireincidentmajor,
        "adFireIncidentMinor": _fireincidentminor
      }).then((_) {
        print("success!");
      });

      String adminUid = '';
      await Firestore.instance
          .collection('users')
          .where('role', arrayContains: 'admin')
          .getDocuments()
          .then((querySnapshot) {
        adminUid = querySnapshot.documents[0].documentID;
      });

      Firestore.instance.collection('activities').document().setData({
        'content': 'Annual data uploaded for location ${widget.locationName}',
        'date': Timestamp.now(),
        'showTo': [
          {'role': 'admin', 'type': 'annualData', 'uid': adminUid}
        ]
      });
    } else {
      firestoreInstance
          .collection('locations')
          .document(widget.locationId)
          .collection('annualData')
          .document('month${DateTime.now().month}')
          .setData({
        "manPower": _manpower,
        "fatal": _fatal,
        "onDutyFatal": _fatalaccidents,
        "reportableAccidents": _reportableaccidents,
        "fireIncidentMajor": _fireincidentmajor,
        "fireIncidentMinor": _fireincidentminor
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Monthly Safety Report (IT /Finance / AFM) (Assessee Entry) '),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(
        child: Form(
          key: this._formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(15.0),
            children: [
              Text('Please fill all the feilds'),
              Text(
                'Manpower',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (String str) {
                  setState(
                    () {
                      _manpower = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'Fatal',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (String str) {
                  setState(
                    () {
                      _fatal = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'On duty Road Fatal Accidents',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (String str) {
                  setState(
                    () {
                      _fatalaccidents = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'Reportable Accidents',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (String str) {
                  setState(
                    () {
                      _reportableaccidents = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'Fire Incident (Major)',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (String str) {
                  setState(
                    () {
                      _fireincidentmajor = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'Fire Incident (Minor)',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                ),
                keyboardType: TextInputType.number,
                onSubmitted: (String str) {
                  setState(
                    () {
                      _fireincidentminor = double.tryParse(str);
                    },
                  );
                },
              ),
              new FloatingActionButton.extended(
                onPressed: () async {
                  await _onPressedSave();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AssesseeDashboard()));
                },
                icon: Icon(
                  Icons.save,
                ),
                shape: RoundedRectangleBorder(),
                label: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
