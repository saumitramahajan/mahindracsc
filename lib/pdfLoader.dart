import 'package:flutter/material.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentForm.dart';
import 'package:mahindraCSC/assessments/siteAssessment/siteAssessmentProvider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';

//final mainReference = FirebaseDatabase.instance.reference().child('Database');
final firestoreInstance = Firestore.instance;

class pdfLoader extends StatefulWidget {
  pdfLoader({
    Key key,
  }) : super(key: key);
  @override
  _pdfLoaderState createState() => _pdfLoaderState();
}

class _pdfLoaderState extends State<pdfLoader> {
  String documentId;

  Future getPdfAndUpload() async {
    File file = await FilePicker.getFile(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc'],
    );

    String basename = file.path.split('/').last;
    String fileName = '${basename}';
    print(fileName);
    print('${file.readAsBytesSync()}');
    savePdf(file.readAsBytesSync(), fileName);
  }

  Future savePdf(List<int> asset, String name) async {
    //firestoreInstance.collection("cycles").document().updateData(' ');
    //StorageReference reference = FirebaseStorage.instance.ref().child(name);
    //StorageUploadTask uploadTask = reference.putData(asset);
    // String url = await (await uploadTask.onComplete).ref.getDownloadURL();
    //print(url);
    //documentFileUpload(url);
    //return  url;
  }

  @override
  void initState() {
    super.initState();
  }

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
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: ListView(
            //shrinkWrap: true,
            padding: EdgeInsets.all(15.0),
            children: <Widget>[
              Text(
                'Fill in the required feilds',
                style: TextStyle(fontSize: 22, color: Colors.red),
                textAlign: TextAlign.left,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          ' Site Name',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          ' Occupier',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          ' Email (Occupier)',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          ' Site Head',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Email  (Site Head)',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Safety Incharge',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Email (Safety Incharge)',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Fire Incharge',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Email (Fire Incharge)',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Office Safety Inchage',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Email (Office Safety Incharge)',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Utilities Incharge',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Email (Utitlities Incharge)',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: new BorderRadius.all(
                                  new Radius.circular(20.0)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Is your site covered under " The Manufacture, Storage, and Import of Hazardous Chemical Rules 1989"',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        (null)
                            ? TextField(
                                controller: null,
                                decoration: InputDecoration(
                                    labelText:
                                        'Mention the Reason for Applicability'),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Is your site has LPG / Propane',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        (null)
                            ? TextField(
                                controller: null,
                                decoration: InputDecoration(
                                    labelText: 'Quantity in Tonnes'),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Is your site has Gasoline',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        (null)
                            ? TextField(
                                controller: null,
                                decoration: InputDecoration(
                                    labelText: 'Quantity in kl'),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Is your site has CNG / PNG',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        (null)
                            ? TextField(
                                controller: null,
                                decoration: InputDecoration(
                                    labelText: 'Quantity in KG'),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Is your site has Paint shop',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        (null)
                            ? TextField(
                                controller: null,
                                decoration:
                                    InputDecoration(labelText: 'Capacity'),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Is your site has Steel Melting / Foundry',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        (null)
                            ? TextField(
                                controller: null,
                                decoration:
                                    InputDecoration(labelText: 'Capacity'),
                              )
                            : SizedBox(),
                        (null)
                            ? RaisedButton(
                                child: Text('Upload Supporting Documents'),
                                onPressed: () {},
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Is your site has Press machine',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        (null)
                            ? TextField(
                                controller: null,
                                decoration: InputDecoration(
                                    labelText:
                                        'Please upload Details of Press Machine'),
                              )
                            : SizedBox(),
                        (null)
                            ? RaisedButton(
                                child: Text('Upload Supporting Documents'),
                                onPressed: () {},
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Is your site has diesel storage',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        (null)
                            ? TextField(
                                controller: null,
                                decoration: InputDecoration(
                                    labelText: 'Quantity in kl'),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Is your site has Thinner / other Class A Storage',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        (null)
                            ? TextField(
                                controller: null,
                                decoration: InputDecoration(
                                    labelText: 'Quantity in kl'),
                              )
                            : SizedBox(),
                        (null)
                            ? RaisedButton(
                                child: Text('Upload Supporting Documents'),
                                onPressed: () {},
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Is your site has Toxic Chemicals',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        (null)
                            ? TextField(
                                controller: null,
                                decoration: InputDecoration(
                                    labelText: 'Quantity and Name'),
                              )
                            : SizedBox(),
                        (null)
                            ? RaisedButton(
                                child: Text('Upload Supporting Documents'),
                                onPressed: () {},
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Is your site has Heat treatment',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        (null)
                            ? TextField(
                                controller: null,
                                decoration:
                                    InputDecoration(labelText: 'Capacity'),
                              )
                            : SizedBox(),
                        (null)
                            ? RaisedButton(
                                child: Text('Upload Supporting Documents'),
                                onPressed: () {},
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          'Is your site has Engine Test Bed',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        (null)
                            ? TextField(
                                controller: null,
                                decoration: InputDecoration(labelText: 'Nos'),
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Is your site has Boiler - is it covered under IBR ( Indian Boiler Regulation)',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.left,
                        ),
                        RadioListTile(
                            title: Text('Yes'),
                            value: true,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        RadioListTile(
                            title: Text('No'),
                            value: false,
                            groupValue: null,
                            onChanged: (value) {
                              setState(() {});
                            }),
                        (null)
                            ? TextField(
                                controller: null,
                                decoration: InputDecoration(
                                    labelText: 'Number and their Capacity'),
                              )
                            : SizedBox(),
                        (null)
                            ? RaisedButton(
                                child: Text('Upload Supporting Documents'),
                                onPressed: () {},
                              )
                            : SizedBox()
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('Incident Statistics for April 2019- March 2020',
                            style: TextStyle(
                              fontSize: 20.0,
                            )),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(labelText: 'Fatal(Nos)'),
                        ),
                        TextField(
                          controller: null,
                          decoration:
                              InputDecoration(labelText: 'Reportable(Nos)'),
                        ),
                        TextField(
                          controller: null,
                          decoration:
                              InputDecoration(labelText: 'Non-Reportable(Nos)'),
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                              labelText: 'First Aid Cases(Nos)'),
                        ),
                        TextField(
                          controller: null,
                          decoration: InputDecoration(
                              labelText: 'Fire Incidents(Major)'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 350,
                  ),
                  new FloatingActionButton.extended(
                    onPressed: () {},
                    icon: Icon(
                      Icons.save,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    label: Text("Submit"),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  FlatButton(
                    child: Text('Upload PDF'),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () {
                      getPdfAndUpload();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
