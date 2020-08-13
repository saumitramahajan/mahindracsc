import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mahindraCSC/login/loginForm.dart';
import 'package:mahindraCSC/login/loginProvider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MahindraCSC Portal'),
      ),
      body: Center(
        child: ChangeNotifierProvider<LoginProvider>(
          create: (_) => LoginProvider(),
          child: LoginForm(),
        ),
      ),
    );
  }
}
