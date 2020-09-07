import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mahindraCSC/roles/assessor/assessorDashboard.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width * .7,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    autovalidate: true,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          obscureText: true,
                          controller: _password,
                          decoration:
                              InputDecoration(labelText: 'Enter New Password'),
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: _confirmPassword,
                          decoration: InputDecoration(
                            labelText: 'Confirm New Password',
                          ),
                          validator: (value) {
                            if (value != _password.text) {
                              return 'Passwords does not match';
                            }
                            return null;
                          },
                        ),
                        RaisedButton(
                          child: Text('Change Password'),
                          onPressed: () async {
                            if (_password.text == _confirmPassword.text) {
                              FirebaseUser user =
                                  await FirebaseAuth.instance.currentUser();
                              user.updatePassword(_password.text).then((value) {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => AssessorDashboard(),
                                ));
                              });
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
