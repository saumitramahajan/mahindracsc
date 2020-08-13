import 'package:flutter/material.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/enrollLocationProvider.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/enrollMahindraLocation.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/enrollVendorLocation.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/viewLocationProvider.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/viewLocations.dart';
import 'package:provider/provider.dart';

class EnrollLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enroll Location'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Select type of Location:'),
            RaisedButton(
                child: Text('Mahindra and Mahindra Location'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ChangeNotifierProvider<EnrollLocationProvider>(
                      create: (context) => EnrollLocationProvider(),
                      child: EnrollMahindraLocation(),
                    );
                  }));
                }),
            RaisedButton(
                child: Text('Vendor Location'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ChangeNotifierProvider<EnrollLocationProvider>(
                      create: (context) => EnrollLocationProvider(),
                      child: EnrollVendorLocation(),
                    );
                  }));
                }),
            RaisedButton(
                child: Text('View Location'),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ChangeNotifierProvider<ViewLocationProvider>(
                      create: (context) => ViewLocationProvider(),
                      child: ViewLocations(),
                    );
                  }));
                })
          ],
        ),
      ),
    );
  }
}
