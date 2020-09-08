import 'package:flutter/material.dart';
import 'package:mahindraCSC/roles/admin/enrollLocation/viewLocationProvider.dart';
import 'package:provider/provider.dart';

class ViewLocations extends StatefulWidget {
  @override
  _ViewLocationsState createState() => _ViewLocationsState();
}

class _ViewLocationsState extends State<ViewLocations> {
  Widget mahindraLocationCard(Map<String, String> map) {
    return Card(
      elevation: 7.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name of Business: ' + map['nameOfSector'],
              style: TextStyle(fontSize: 25),
            ),
            Text(
              'Location: ' + map['location'],
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Assessee: ' + map['assessee'],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Category: ' + map['category']),
            Text('Name of Sector: ' + map['nameOfSector']),
            SizedBox(
              height: 10,
            ),
            Text('Last Assessment Stage: ' + map['lastAssessmentStage']),
            Text('Process Level: ' + map['processLevel']),
            Text('Result Level: ' + map['resultLevel']),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Plant Head Name: ' + map['plantHeadName']),
                    Text('Plant Head Email: ' + map['plantHeadEmail']),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        'Sector/Business Safety SPOC Name: ' + map['spocName']),
                    Text('Sector/Business Safety SPOC Email: ' +
                        map['spocEmail']),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget vendorLocationCard(Map<String, String> map) {
    return Card(
      elevation: 7.0,
      child: Column(
        children: [
          Text('Name of Business: ' + map['nameOfBusiness']),
          Text('Location: ' + map['location']),
          Text('Assessee: ' + map['assessee']),
          Text('Plant Head Name: ' + map['plantHeadName']),
          Text('Plant Head Email: ' + map['plantHeadEmail']),
          Text('Plant Head Phone Number: ' + map['plantHeadPhoneNumber']),
          Text('SSU Personnel Name: ' + map['personnelName']),
          Text('SSU Personnel Email: ' + map['personnelEmail']),
          Text('SSU Personnel Phone Number: ' + map['personnelPhoneNumber']),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewProvider = Provider.of<ViewLocationProvider>(context);
    return Scaffold(
      body: viewProvider.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Text(
                    'List of Locations',
                    style: TextStyle(fontSize: 30.0),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewProvider.list.length,
                      itemBuilder: (context, index) {
                        Map<String, String> map = viewProvider.list[index];
                        return (map['typeOfLocation'] == 'mahindra')
                            ? mahindraLocationCard(map)
                            : vendorLocationCard(map);
                      },
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
