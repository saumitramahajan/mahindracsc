import 'package:flutter/material.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/enrollLocationProvider.dart';
import 'package:provider/provider.dart';

class EnrollMahindraLocation extends StatefulWidget {
  @override
  _EnrollMahindraLocationState createState() => _EnrollMahindraLocationState();
}

class _EnrollMahindraLocationState extends State<EnrollMahindraLocation> {
  String _valueCategory = 'Manufacturing,Hospitality and Construction Sector';
  String _valueLastAssessmentStage;
  String _valueProcessLevel;
  String _valueResultLevel;
  String _valueAssesseeUid;

  String _nameOfSector;
  String _nameOfBusiness;
  String _location;
  String _plantHeadName;
  String _plantHeadEmail;
  String _sectorBusinessSafetySpocName;
  String _sectorBusinessSafetySpocEmail;

  @override
  Widget build(BuildContext context) {
    final enrollProvider = Provider.of<EnrollLocationProvider>(context);
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
      body: enrollProvider.loading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Text('Category: '),
                      DropdownButton<String>(
                        items: [
                          DropdownMenuItem<String>(
                            child: Text(
                                'Manufacturing,Hospitality and Construction Sector'),
                            value:
                                'Manufacturing,Hospitality and Construction Sector',
                          ),
                          DropdownMenuItem<String>(
                            child: Text('IT,Finance and Aftermarket Sectors'),
                            value: 'IT,Finance and Aftermarket Sectors',
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            _valueCategory = value;
                          });
                        },
                        hint: Text('Select Category'),
                        value: _valueCategory,
                      )
                    ],
                  ),
                  (_valueCategory ==
                          'Manufacturing,Hospitality and Construction Sector')
                      ? Column(
                          children: [
                            TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Enter Name of Business/Sector';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                _nameOfSector = value;
                              },
                              decoration:
                                  InputDecoration(labelText: 'Name of Sector'),
                            ),
                            TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Enter Location';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                _location = value;
                              },
                              decoration:
                                  InputDecoration(labelText: 'Location'),
                            ),
                            Row(
                              children: [
                                Text('Last Assessment Stage: '),
                                DropdownButton<String>(
                                  items: <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                                      .map((int value) {
                                    return new DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: new Text(value.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _valueLastAssessmentStage = value;
                                    });
                                  },
                                  hint: Text('Rate from 1-10'),
                                  value: _valueLastAssessmentStage,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Process Level: '),
                                DropdownButton<String>(
                                  items: <int>[1, 2, 3, 4, 5].map((int value) {
                                    return new DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: new Text(value.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _valueProcessLevel = value;
                                    });
                                  },
                                  hint: Text('Rate from 1-5'),
                                  value: _valueProcessLevel,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Result Level: '),
                                DropdownButton<String>(
                                  items: <int>[1, 2, 3, 4, 5].map((int value) {
                                    return new DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: new Text(value.toString()),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      _valueResultLevel = value;
                                    });
                                  },
                                  hint: Text('Rate from 1-5'),
                                  value: _valueResultLevel,
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('Assessee: '),
                                DropdownButton<String>(
                                  items: enrollProvider.assessee,
                                  onChanged: (value) {
                                    setState(() {
                                      _valueAssesseeUid = value;
                                    });
                                  },
                                  hint: Text('Select One'),
                                  value: _valueAssesseeUid,
                                )
                              ],
                            ),
                            TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Enter Plant Head Name';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                _plantHeadName = value;
                              },
                              decoration:
                                  InputDecoration(labelText: 'Plant Head Name'),
                            ),
                            TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Enter Plant Head Email';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                _plantHeadEmail = value;
                              },
                              decoration: InputDecoration(
                                  labelText: 'Plant Head Email'),
                            ),
                            TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Enter Sector/Business Safety Spoc Name';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                _sectorBusinessSafetySpocName = value;
                              },
                              decoration: InputDecoration(
                                  labelText:
                                      'Sector/Business Safety Spoc Name'),
                            ),
                            TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Enter Sector/Business Safety Spoc Email';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                _sectorBusinessSafetySpocEmail = value;
                              },
                              decoration: InputDecoration(
                                  labelText:
                                      'Sector/Business Safety Spoc Email'),
                            ),
                            RaisedButton(
                              child: Text('Enroll'),
                              onPressed: () async {
                                await enrollProvider.enrollMahindraLocation(
                                    _valueCategory,
                                    _nameOfSector,
                                    _nameOfBusiness,
                                    _location,
                                    _valueLastAssessmentStage,
                                    _valueProcessLevel,
                                    _valueResultLevel,
                                    _valueAssesseeUid,
                                    _plantHeadName,
                                    _plantHeadEmail,
                                    _sectorBusinessSafetySpocName,
                                    _sectorBusinessSafetySpocEmail);
                                if (enrollProvider.enrolled) {
                                  Navigator.of(context).pop();
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: new Text('Enroll Failed'),
                                          content: new Text(
                                              'Something has occured.Please try again later.'),
                                          actions: <Widget>[
                                            new FlatButton(
                                              child: new Text('Close'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        );
                                      });
                                }
                              },
                            )
                          ],
                        )
                      : SizedBox()
                ],
              )),
            ),
    );
  }
}
