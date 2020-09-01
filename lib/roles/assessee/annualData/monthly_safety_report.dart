import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mahindraCSC/roles/assessee/annualData/assesseeDashboard.dart';

final firestoreInstance = Firestore.instance;

class MonthlySafetyReport extends StatefulWidget {
  final String type;
  final String cycleId;
  final String locationId;
  final String locationName;

  MonthlySafetyReport(
      {Key key, this.type, this.cycleId, this.locationId, this.locationName})
      : super(key: key);
  @override
  _MonthlySafetyReport createState() => _MonthlySafetyReport();
}

class _MonthlySafetyReport extends State<MonthlySafetyReport> {
  final _formKey = GlobalKey<FormState>();

  double _manpower = 0,
      _fatal = 0,
      _fatalaccidents = 0,
      _seriousAccidents = 0,
      _reportableaccidents = 0,
      _mandayslost = 0,
      _nonreportableaccidents = 0,
      _mandayslostnra = 0,
      _firstaidaccidents = 0,
      _totalaccidents = 0,
      _fireincident = 0,
      _fireincidentminor = 0,
      _kaizen = 0,
      _identified = 0,
      _safetyactivityrate = 0,
      _closureof = 0,
      _themebasedinspection = 0,
      _nearmissincident = 0;
  final fatalController = TextEditingController();
  final reportableaccController = TextEditingController();
  final nonreportableaccController = TextEditingController();
  final firstaidaccController = TextEditingController();
  final totalaccController = TextEditingController();

  void _onPressedSave() async {
    if (widget.type == 'assessment') {
      firestoreInstance
          .collection("cycles")
          .document(widget.cycleId)
          .updateData({
        "adCategory": 'category1',
        "adManPower": _manpower,
        "adFatal": _fatal,
        "adFatalAccidents": _fatalaccidents,
        'adSeriousAccidents': _seriousAccidents,
        "adReportableAccidents": _reportableaccidents,
        "adManDaysLost": _mandayslost,
        "adNoReportableAccidents": _nonreportableaccidents,
        "adManDaysLostNra": _mandayslostnra,
        "adFirstaidAccidents": _firstaidaccidents,
        "adTotalAccidents": _totalaccidents,
        "adFireIncident": _fireincident,
        "adFireIncidentMinor": _fireincidentminor,
        "adKaizen": _kaizen,
        "adIdentified": _identified,
        "adSafetyActivityRate": _safetyactivityrate,
        "adClosureOf": _closureof,
        "adThemeBasedInspections": _themebasedinspection,
        "adNearMissIncident": _nearmissincident
      }).then((_) {
        print("success!");
      });
    } else {
      Firestore.instance
          .collection('locations')
          .document(widget.locationId)
          .collection('monthlyData')
          .document('month${DateTime.now().month}')
          .setData({
        "adCategory": 'category1',
        "manPower": _manpower,
        "fatal": _fatal,
        "fatalAccidents": _fatalaccidents,
        'seriousAccidents': _seriousAccidents,
        "reportableAccidents": _reportableaccidents,
        "manDaysLost": _mandayslost,
        "noReportableAccidents": _nonreportableaccidents,
        "manDaysLostNra": _mandayslostnra,
        "firstaidAccidents": _firstaidaccidents,
        "totalAccidents": _totalaccidents,
        "fireIncident": _fireincident,
        "fireIncidentMinor": _fireincidentminor,
        "kaizen": _kaizen,
        "identified": _identified,
        "safetyActivityRate": _safetyactivityrate,
        "closureOf": _closureof,
        "themeBasedInspections": _themebasedinspection,
        "nearMissIncident": _nearmissincident
      });
    }
  }

  void _update_totAcc() {
    totalaccController.text = (_fatal +
            _reportableaccidents +
            _nonreportableaccidents +
            _firstaidaccidents)
        .toString();
  }

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    fatalController.addListener(_update_totAcc);
    reportableaccController.addListener(_update_totAcc);
    nonreportableaccController.addListener(_update_totAcc);
    firstaidaccController.addListener(_update_totAcc);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    fatalController.dispose();
    reportableaccController.dispose();
    nonreportableaccController.dispose();
    firstaidaccController.dispose();
    totalaccController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monthly Safety Report (Assessee Entry) '),
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
                  hintText: 'Man Power',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String str) {
                  setState(
                    () {
                      _manpower = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'Fatal (A)',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'Fatal Accidents',
                ),
                keyboardType: TextInputType.number,
                controller: fatalController,
                onChanged: (String str) {
                  setState(() {
                    _fatal = double.tryParse(str);
                  });
                },
              ),
              Text(
                'Reportable Accidents (B)',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'Reportable Accidents',
                ),
                keyboardType: TextInputType.number,
                controller: reportableaccController,
                onChanged: (String str) {
                  setState(
                    () {
                      _reportableaccidents = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'Man-days lost due to Reportable Accidents',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'Man-days lost (RA)',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String str) {
                  setState(
                    () {
                      _mandayslost = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'Non-Reportable Accidents (C)',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'Non-Reportable Accidents',
                ),
                keyboardType: TextInputType.number,
                controller: nonreportableaccController,
                onChanged: (String str) {
                  setState(
                    () {
                      _nonreportableaccidents = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'Man-days lost due to Non-Reportable Accidents',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'Man-days lost (NRA)',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String str) {
                  setState(
                    () {
                      _mandayslostnra = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'First Aid Accidents (D)',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'First Aid Accidents',
                ),
                keyboardType: TextInputType.number,
                controller: firstaidaccController,
                onChanged: (String str) {
                  setState(() {
                    _firstaidaccidents = double.tryParse(str);
                  });
                },
              ),
              Text(
                'Total Accidents (A+B+C+D)',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'Total Accidents',
                ),
                keyboardType: TextInputType.number,
                controller: totalaccController,
                onChanged: (String str) {
                  setState(
                    () {
                      _totalaccidents = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'On Duty Road Accidents(Fatal)',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'On Duty Road Fatal Accidents',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String str) {
                  setState(
                    () {
                      _fatalaccidents = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'On Duty Road Accidents(Serious)',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'On Duty Road Fatal Accidents',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String str) {
                  setState(
                    () {
                      _seriousAccidents = double.tryParse(str);
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
                  hintText: 'Fire Incident (Major)',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String str) {
                  setState(
                    () {
                      _fireincident = double.tryParse(str);
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
                  hintText: 'Fire Incident (Minor)',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String str) {
                  setState(
                    () {
                      _fireincidentminor = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'Kaizen / Poka-Yoke',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'Kaizen / Poka-Yoke',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String str) {
                  setState(
                    () {
                      _kaizen = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'Identified UA /UC',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'Identified UA /UC',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String str) {
                  setState(
                    () {
                      _identified = double.tryParse(str);
                    },
                  );
                },
              ),
              Text(
                'Safety Activity Rate',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'Safety Activity Rate',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String str) {
                  setState(() {
                    _safetyactivityrate = double.tryParse(str);
                  });
                },
              ),
              Text(
                'Closure of UA/UC',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'Closure of UA/UC',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String str) {
                  setState(() {
                    _closureof = double.tryParse(str);
                  });
                },
              ),
              Text(
                'Theme Based Inspection ',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'Theme Based Inspection ',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String str) {
                  setState(() {
                    _themebasedinspection = double.tryParse(str);
                  });
                },
              ),
              Text(
                'Near Miss Incident',
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.left,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numbers',
                  hintText: 'Near Miss Incident',
                ),
                keyboardType: TextInputType.number,
                onChanged: (String str) {
                  setState(
                    () {
                      _nearmissincident = double.tryParse(str);
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
