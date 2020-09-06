import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentForm.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:provider/provider.dart';

class LocationInfo extends StatefulWidget {
  final bool dataExists;
  final String documentId;
  final String siteName;
  final String occupierName;
  final String occupierEmail;
  final String headName;
  final String headEmail;
  final String safetyInchargeName;
  final String safetyInchargeEmail;
  final String fireInchargeName;
  final String fireInchargeEmail;
  final String officeSafetyInchargeName;
  final String officeSafetyInchargeEmail;
  final String utilitiesName;
  final String utilitiesEmail;
  final String rule;
  final String lpg;
  final String gasoline;
  final String cng;
  final String paintShop;
  final String foundry;
  final String press;
  final String desiel;
  final String thinner;
  final String toxic;
  final String heat;
  final String testBed;
  final String ibr;
  final String fatal;
  final String reportable;
  final String nonReportable;
  final String firstAid;
  final String fire;
  final bool ruleValue;
  final bool lpgValue;
  final bool gasolineValue;
  final bool cngValue;
  final bool paintShopValue;
  final bool foundryValue;
  final bool pressValue;
  final bool desielValue;
  final bool thinnerValue;
  final bool toxicValue;
  final bool heatValue;
  final bool testBedValue;
  final bool ibrValue;

  LocationInfo(
      {Key key,
      this.dataExists,
      this.documentId,
      this.siteName,
      this.occupierName,
      this.occupierEmail,
      this.headName,
      this.headEmail,
      this.safetyInchargeName,
      this.safetyInchargeEmail,
      this.fireInchargeName,
      this.fireInchargeEmail,
      this.officeSafetyInchargeName,
      this.officeSafetyInchargeEmail,
      this.utilitiesName,
      this.utilitiesEmail,
      this.rule,
      this.lpg,
      this.gasoline,
      this.cng,
      this.paintShop,
      this.foundry,
      this.press,
      this.desiel,
      this.thinner,
      this.toxic,
      this.heat,
      this.testBed,
      this.ibr,
      this.fatal,
      this.reportable,
      this.nonReportable,
      this.firstAid,
      this.fire,
      this.ruleValue,
      this.lpgValue,
      this.gasolineValue,
      this.cngValue,
      this.paintShopValue,
      this.foundryValue,
      this.pressValue,
      this.desielValue,
      this.thinnerValue,
      this.toxicValue,
      this.heatValue,
      this.testBedValue,
      this.ibrValue})
      : super(key: key);
  @override
  _LocationInfoState createState() => _LocationInfoState();
}

class _LocationInfoState extends State<LocationInfo> {
  String documentId;
  TextEditingController _siteName = TextEditingController();
  TextEditingController _occupierName = TextEditingController();
  TextEditingController _occupierEmail = TextEditingController();
  TextEditingController _headName = TextEditingController();
  TextEditingController _headEmail = TextEditingController();
  TextEditingController _safetyInchargeName = TextEditingController();
  TextEditingController _safetyInchargeEmail = TextEditingController();
  TextEditingController _fireInchargeName = TextEditingController();
  TextEditingController _fireInchargeEmail = TextEditingController();
  TextEditingController _officeSafetyInchargeName = TextEditingController();
  TextEditingController _officeSafetyInchargeEmail = TextEditingController();
  TextEditingController _utilitiesName = TextEditingController();
  TextEditingController _utilitiesEmail = TextEditingController();
  TextEditingController _rule = TextEditingController();
  TextEditingController _lpg = TextEditingController();
  TextEditingController _gasoline = TextEditingController();
  TextEditingController _cng = TextEditingController();
  TextEditingController _paintShop = TextEditingController();
  TextEditingController _foundry = TextEditingController();
  TextEditingController _press = TextEditingController();
  TextEditingController _desiel = TextEditingController();
  TextEditingController _thinner = TextEditingController();
  TextEditingController _toxic = TextEditingController();
  TextEditingController _heat = TextEditingController();
  TextEditingController _testBed = TextEditingController();
  TextEditingController _ibr = TextEditingController();
  TextEditingController _fatal = TextEditingController();
  TextEditingController _reportable = TextEditingController();
  TextEditingController _nonReportable = TextEditingController();
  TextEditingController _firstAid = TextEditingController();
  TextEditingController _fire = TextEditingController();
  bool _ruleValue = false;
  bool _lpgValue = false;
  bool _gasolineValue = false;
  bool _cngValue = false;
  bool _paintShopValue = false;
  bool _foundryValue = false;
  bool _pressValue = false;
  bool _desielValue = false;
  bool _thinnerValue = false;
  bool _toxicValue = false;
  bool _heatValue = false;
  bool _testBedValue = false;
  bool _ibrValue = false;

  @override
  void initState() {
    super.initState();
    print(widget.dataExists);
    if (widget.dataExists) {
      _siteName.text = widget.siteName;
      documentId = widget.documentId;
      _occupierName.text = widget.occupierName;
      _occupierEmail.text = widget.occupierEmail;
      _headName.text = widget.headName;
      _headEmail.text = widget.headEmail;
      _safetyInchargeEmail.text = widget.safetyInchargeEmail;
      _safetyInchargeName.text = widget.safetyInchargeName;
      _fireInchargeName.text = widget.fireInchargeName;
      _fireInchargeEmail.text = widget.fireInchargeEmail;
      _officeSafetyInchargeName.text = widget.officeSafetyInchargeName;
      _officeSafetyInchargeEmail.text = widget.officeSafetyInchargeEmail;
      _utilitiesName.text = widget.utilitiesName;
      _utilitiesEmail.text = widget.utilitiesEmail;
      _rule.text = widget.rule;
      _lpg.text = widget.lpg;
      _gasoline.text = widget.gasoline;
      _cng.text = widget.cng;
      _paintShop.text = widget.paintShop;
      _foundry.text = widget.foundry;
      _press.text = widget.press;
      _desiel.text = widget.desiel;
      _thinner.text = widget.thinner;
      _toxic.text = widget.toxic;
      _heat.text = widget.heat;
      _testBed.text = widget.testBed;
      _ibr.text = widget.ibr;
      _fatal.text = widget.fatal;
      _reportable.text = widget.reportable;
      _nonReportable.text = widget.nonReportable;
      _firstAid.text = widget.firstAid;
      _fire.text = widget.fire;
      _ruleValue = widget.ruleValue;
      _lpgValue = widget.lpgValue;
      _gasolineValue = widget.gasolineValue;
      _cngValue = widget.cngValue;
      _paintShopValue = widget.paintShopValue;
      _foundryValue = widget.foundryValue;
      _pressValue = widget.pressValue;
      _desielValue = widget.desielValue;
      _thinnerValue = widget.thinnerValue;
      _toxicValue = widget.toxicValue;
      _heatValue = widget.heatValue;
      _testBedValue = widget.testBedValue;
      _ibrValue = widget.ibrValue;
      print('Data setup finished' +
          _pressValue.toString() +
          _desielValue.toString());
    } else {
      documentId = widget.documentId;
    }
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
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.7,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _siteName,
                            decoration:
                                InputDecoration(labelText: 'Name of the Site'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _occupierName,
                            decoration: InputDecoration(
                                labelText: 'Name of the Occupier'),
                          ),
                          TextField(
                            controller: _occupierEmail,
                            decoration: InputDecoration(
                                labelText: 'Email of the Occupier'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _headName,
                            decoration: InputDecoration(
                                labelText: 'Name of the Site Head'),
                          ),
                          TextField(
                            controller: _headEmail,
                            decoration: InputDecoration(
                                labelText: 'Email of the Site Head'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _safetyInchargeName,
                            decoration: InputDecoration(
                                labelText: 'Name of the Safety Incharge'),
                          ),
                          TextField(
                            controller: _safetyInchargeEmail,
                            decoration: InputDecoration(
                                labelText: 'Email of the Safety Incharge'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _fireInchargeName,
                            decoration: InputDecoration(
                                labelText: 'Name of the Fire Incharge'),
                          ),
                          TextField(
                            controller: _fireInchargeEmail,
                            decoration: InputDecoration(
                                labelText: 'Email of the Fire Incharge'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _officeSafetyInchargeName,
                            decoration: InputDecoration(
                                labelText: 'Name of the Office Safety Inchage'),
                          ),
                          TextField(
                            controller: _officeSafetyInchargeEmail,
                            decoration: InputDecoration(
                                labelText:
                                    'Email of the Office Safety Incharge'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: _utilitiesName,
                            decoration: InputDecoration(
                                labelText: 'Name of the Utilities Inchage'),
                          ),
                          TextField(
                            controller: _utilitiesEmail,
                            decoration: InputDecoration(
                                labelText: 'Email of the Utitlities Incharge'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                            'Is your site covered under " The Manufacture, Storage, and Import of Hazardous Chemical Rules 1989"'),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: _ruleValue,
                            onChanged: (value) {
                              setState(() {
                                _ruleValue = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: _ruleValue,
                            onChanged: (value) {
                              setState(() {
                                _ruleValue = value;
                              });
                            }),
                        (_ruleValue)
                            ? TextField(
                                controller: _rule,
                                decoration: InputDecoration(
                                    labelText:
                                        'Mention the Reason for Applicability'),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text('Is your site has LPG / Propane'),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: _lpgValue,
                            onChanged: (value) {
                              setState(() {
                                _lpgValue = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: _lpgValue,
                            onChanged: (value) {
                              setState(() {
                                _lpgValue = value;
                              });
                            }),
                        (_lpgValue)
                            ? TextField(
                                controller: _lpg,
                                decoration: InputDecoration(
                                    labelText: 'Quantity in Tonnes'),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text('Is your site has Gasoline'),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: _gasolineValue,
                            onChanged: (value) {
                              setState(() {
                                _gasolineValue = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: _gasolineValue,
                            onChanged: (value) {
                              setState(() {
                                _gasolineValue = value;
                              });
                            }),
                        (_gasolineValue)
                            ? TextField(
                                controller: _gasoline,
                                decoration: InputDecoration(
                                    labelText: 'Quantity in kl'),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text('Is your site has CNG / PNG'),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: _cngValue,
                            onChanged: (value) {
                              setState(() {
                                _cngValue = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: _cngValue,
                            onChanged: (value) {
                              setState(() {
                                _cngValue = value;
                              });
                            }),
                        (_cngValue)
                            ? TextField(
                                controller: _cng,
                                decoration: InputDecoration(
                                    labelText: 'Quantity in KG'),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text('Is your site has Paint shop'),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: _paintShopValue,
                            onChanged: (value) {
                              setState(() {
                                _paintShopValue = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: _paintShopValue,
                            onChanged: (value) {
                              setState(() {
                                _paintShopValue = value;
                              });
                            }),
                        (_paintShopValue)
                            ? TextField(
                                controller: _paintShop,
                                decoration:
                                    InputDecoration(labelText: 'Capacity'),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text('Is your site has Steel Melting / Foundry'),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: _foundryValue,
                            onChanged: (value) {
                              setState(() {
                                _foundryValue = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: _foundryValue,
                            onChanged: (value) {
                              setState(() {
                                _foundryValue = value;
                              });
                            }),
                        (_foundryValue)
                            ? TextField(
                                controller: _foundry,
                                decoration:
                                    InputDecoration(labelText: 'Capacity'),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text('Is your site has Press machine'),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: _pressValue,
                            onChanged: (value) {
                              setState(() {
                                _pressValue = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: _pressValue,
                            onChanged: (value) {
                              setState(() {
                                _pressValue = value;
                              });
                            }),
                        (_pressValue)
                            ? TextField(
                                controller: _press,
                                decoration:
                                    InputDecoration(labelText: 'Capacity'),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text('Is your site has diesel storage'),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: _desielValue,
                            onChanged: (value) {
                              setState(() {
                                _desielValue = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: _desielValue,
                            onChanged: (value) {
                              setState(() {
                                _desielValue = value;
                              });
                            }),
                        (_desielValue)
                            ? TextField(
                                controller: _desiel,
                                decoration: InputDecoration(
                                    labelText: 'Quantity in kl'),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                            'Is your site has Thinner / other Class A Storage'),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: _thinnerValue,
                            onChanged: (value) {
                              setState(() {
                                _thinnerValue = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: _thinnerValue,
                            onChanged: (value) {
                              setState(() {
                                _thinnerValue = value;
                              });
                            }),
                        (_thinnerValue)
                            ? TextField(
                                controller: _thinner,
                                decoration: InputDecoration(
                                    labelText: 'Quantity in kl'),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text('Is your site has Toxic Chemicals'),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: _toxicValue,
                            onChanged: (value) {
                              setState(() {
                                _toxicValue = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: _toxicValue,
                            onChanged: (value) {
                              setState(() {
                                _toxicValue = value;
                              });
                            }),
                        (_toxicValue)
                            ? TextField(
                                controller: _toxic,
                                decoration: InputDecoration(
                                    labelText: 'Quantity and Name'),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text('Is your site has Heat treatment'),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: _heatValue,
                            onChanged: (value) {
                              setState(() {
                                _heatValue = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: _heatValue,
                            onChanged: (value) {
                              setState(() {
                                _heatValue = value;
                              });
                            }),
                        (_heatValue)
                            ? TextField(
                                controller: _heat,
                                decoration:
                                    InputDecoration(labelText: 'Capacity'),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text('Is your site has Engine Test Bed'),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: _testBedValue,
                            onChanged: (value) {
                              setState(() {
                                _testBedValue = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: _testBedValue,
                            onChanged: (value) {
                              setState(() {
                                _testBedValue = value;
                              });
                            }),
                        (_testBedValue)
                            ? TextField(
                                controller: _testBed,
                                decoration: InputDecoration(labelText: 'Nos'),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
                  Card(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                            'Is your site has Boiler - is it covered under IBR ( Indian Boiler Regulation)'),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: _ibrValue,
                            onChanged: (value) {
                              setState(() {
                                _ibrValue = value;
                              });
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: _ibrValue,
                            onChanged: (value) {
                              setState(() {
                                _ibrValue = value;
                              });
                            }),
                        (_ibrValue)
                            ? TextField(
                                controller: _ibr,
                                decoration: InputDecoration(
                                    labelText: 'Number and their Capacity'),
                              )
                            : SizedBox()
                      ],
                    ),
                  )),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text('Incident Statistics',
                              style: TextStyle(
                                fontSize: 20.0,
                              )),
                          TextField(
                            controller: _fatal,
                            decoration:
                                InputDecoration(labelText: 'Fatal(Nos)'),
                          ),
                          TextField(
                            controller: _reportable,
                            decoration:
                                InputDecoration(labelText: 'Reportable(Nos)'),
                          ),
                          TextField(
                            controller: _nonReportable,
                            decoration: InputDecoration(
                                labelText: 'Non-Reportable(Nos)'),
                          ),
                          TextField(
                            controller: _firstAid,
                            decoration: InputDecoration(
                                labelText: 'First Aid Cases(Nos)'),
                          ),
                          TextField(
                            controller: _fire,
                            decoration: InputDecoration(
                                labelText: 'Fire Incidents(Major)'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  RaisedButton(
                    child: assessmentProvider.locationDataUploading
                        ? CircularProgressIndicator()
                        : Text('Save'),
                    onPressed: () async {
                      await assessmentProvider.setLocationData(
                          documentId,
                          _siteName.text,
                          _occupierName.text,
                          _occupierEmail.text,
                          _headName.text,
                          _headEmail.text,
                          _safetyInchargeName.text,
                          _safetyInchargeEmail.text,
                          _fireInchargeName.text,
                          _fireInchargeEmail.text,
                          _officeSafetyInchargeName.text,
                          _officeSafetyInchargeEmail.text,
                          _utilitiesName.text,
                          _utilitiesEmail.text,
                          _rule.text,
                          _lpg.text,
                          _gasoline.text,
                          _cng.text,
                          _paintShop.text,
                          _foundry.text,
                          _press.text,
                          _desiel.text,
                          _thinner.text,
                          _toxic.text,
                          _heat.text,
                          _testBed.text,
                          _ibr.text,
                          _fatal.text,
                          _reportable.text,
                          _nonReportable.text,
                          _firstAid.text,
                          _fire.text,
                          _ruleValue,
                          _lpgValue,
                          _gasolineValue,
                          _cngValue,
                          _paintShopValue,
                          _foundryValue,
                          _pressValue,
                          _desielValue,
                          _thinnerValue,
                          _toxicValue,
                          _heatValue,
                          _testBedValue,
                          _ibrValue);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          return ChangeNotifierProvider.value(
                            value: assessmentProvider,
                            child: SiteAssessmentForm(),
                          );
                        },
                      ));
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
