import 'package:flutter/material.dart';
import 'package:mahindraCSC/roles/admin/enrollUsers/enrollUsersProvider.dart';
import 'package:provider/provider.dart';

class EnrollUsersForm extends StatefulWidget {
  @override
  _EnrollUsersFormState createState() => _EnrollUsersFormState();
}

class _EnrollUsersFormState extends State<EnrollUsersForm> {
  String _name, _email, _number;
  bool assessorVal = false;
  bool assesseeVal = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EnrollUsersProvider>(context);
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Enter Name';
                }
              },
              onChanged: (input) => _name = input,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Enter Email';
                }
              },
              onChanged: (input) => _email = input,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Enter Number';
                }
              },
              onChanged: (input) => _number = input,
              decoration: InputDecoration(labelText: 'Number'),
            ),
            Text('Select Role :'),
            Row(
              children: [
                Text('Assessor'),
                Checkbox(
                    value: assessorVal,
                    onChanged: (bool value) {
                      setState(() {
                        assessorVal = value;
                      });
                    }),
              ],
            ),
            Row(
              children: [
                Text('Assessee'),
                Checkbox(
                    value: assesseeVal,
                    onChanged: (bool value) {
                      setState(() {
                        assesseeVal = value;
                      });
                    }),
              ],
            ),
            Row(
              children: [
                RaisedButton(
                  child: provider.loading
                      ? CircularProgressIndicator()
                      : Text('Enroll User'),
                  onPressed: () async {
                    await provider.enrollUser(
                        _email, _name, _number, assessorVal, assesseeVal);
                    if (provider.enrolled) {
                      Navigator.of(context).pop();
                    } else {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: new Text('Error!'),
                              content: new Text(
                                  'Some problem has occured. Please try again.'),
                              actions: <Widget>[
                                new FlatButton(
                                  child: new Text('close'),
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
          ],
        ),
      ),
    );
  }
}
