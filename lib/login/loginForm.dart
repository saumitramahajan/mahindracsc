import 'package:flutter/material.dart';
import 'package:mahindraCSC/login/choice.dart';
import 'package:mahindraCSC/login/loginProvider.dart';
import 'package:mahindraCSC/login/resetPassword.dart';
import '../roles/admin/dashboard/adminDashboard.dart';
import '../roles/admin/dashboard/adminProvider.dart';
import 'package:mahindraCSC/roles/assessee/assesseeDashboard.dart';
import 'package:mahindraCSC/roles/assessee/assesseeProvider.dart';
import 'package:mahindraCSC/roles/assessor/assessorDashboard.dart';
import 'package:mahindraCSC/roles/assessor/assessorProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email, _password;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Container(
      child: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please type an email';
                }
              },
              onChanged: (input) => _email = input,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              validator: (input) {
                if (input.length < 6) {
                  return 'Your password needs to be atleast 6 characters';
                }
              },
              onChanged: (input) => _password = input,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            RaisedButton(
                child: Text('Login'),
                onPressed: () async {
                  _email = 'test.assessee@mahindra.com';
                  _password = 'test.assessee';
                  await loginProvider.loginProvider(_email, _password);
                  if (loginProvider.userExists) {
                    if (loginProvider.singleRole) {
                      switch (loginProvider.roleString) {
                        case 'admin':
                          {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return ChangeNotifierProvider<AdminProvider>(
                                create: (_) => AdminProvider(),
                                child: AdminDashboard(),
                              );
                            }));
                          }
                          break;
                        case 'assessee':
                          {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return ChangeNotifierProvider<AssesseeProvider>(
                                create: (_) => AssesseeProvider(),
                                child: AssesseeDashboard(),
                              );
                            }));
                          }
                          break;
                        case 'assessor':
                          {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                              return ChangeNotifierProvider<AssessorProvider>(
                                create: (_) => AssessorProvider(),
                                child: AssessorDashboard(),
                              );
                            }));
                          }
                          break;
                      }
                    } else {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return Choice();
                      }));
                    }
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: new Text('Email not Registered'),
                            content: new Text(
                                'Please contact to admin at ggfhsj@gmail.com'),
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
                }),
            SizedBox(
              height: 7.0,
            ),
            GestureDetector(
              child: Text('Forgot Password/New User'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ChangeNotifierProvider.value(
                    value: loginProvider,
                    child: ResetPassword(),
                  );
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
