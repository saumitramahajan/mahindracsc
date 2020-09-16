import 'package:flutter/material.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/enrollLocationProvider.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/enrollMahindraLocation.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/viewLocationProvider.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/viewLocations.dart';
import 'package:provider/provider.dart';

class EnrollLocation extends StatelessWidget {
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
          actions: [
            IconButton(
                tooltip: 'Add Location',
                icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ChangeNotifierProvider<EnrollLocationProvider>(
                      create: (context) => EnrollLocationProvider(),
                      child: EnrollMahindraLocation(),
                    );
                  }));
                }),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            )
          ],
          titleSpacing: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ChangeNotifierProvider<ViewLocationProvider>(
                create: (context) => ViewLocationProvider(),
                child: ViewLocations(),
              ),
            ),
          ],
        ));
  }
}
