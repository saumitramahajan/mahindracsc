import 'package:flutter/material.dart';
import 'package:mahindraCSC/login/loginProvider.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
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
      body: Container(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: 'Email Address', labelText: 'Email Address'),
              controller: _email,
            ),
            RaisedButton(
              child: loginProvider.loading
                  ? CircularProgressIndicator()
                  : Text('Send link'),
              onPressed: () {
                loginProvider.passwordReset(_email.text);
                if (loginProvider.linkSent) {
                  Navigator.of(context).pop();
                } else {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error!'),
                        content:
                            Text('Some error has occured. Please try again!'),
                        actions: <Widget>[
                          FlatButton(
                            child: Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
