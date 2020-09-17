import 'package:flutter/material.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/enrollLocationProvider.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/enrollMahindraLocation.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/viewLocationProvider.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/viewLocations.dart';
import 'package:provider/provider.dart';

import '../../../utilities.dart';

class EnrollLocation extends StatelessWidget {
  Utilities utilities = Utilities();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              backgroundColor: utilities.mainColor,
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
            )),
        SizedBox(
          height: AppBar().preferredSize.height * 2,
          child: Image.asset(
            'assets/mahindraAppBar.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
