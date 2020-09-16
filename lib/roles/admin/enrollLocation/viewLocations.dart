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
        body: Center(
            child: viewProvider.loading
                ? CircularProgressIndicator()
                : Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 100),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text(
                              'List of Locations:',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[700]),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                                  child: Text(
                                    'Name of Business',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(50, 10, 10, 10),
                                  child: Text(
                                    'Assessee',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(70, 10, 10, 10),
                                  child: Text(
                                    'Category',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(80, 10, 10, 10),
                                  child: Text(
                                    'Name of sector',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(30, 10, 10, 10),
                                  child: Text(
                                    'Last Assessment Stage',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text(
                                    'Result level',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                  child: Text(
                                    'Process level',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                            ],
                          ),
                          Expanded(
                              child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 5.0,
                                margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        child: SizedBox(
                                          width: 150,
                                          child: Text(
                                            'Test Mahindra location',
                                            style: TextStyle(
                                              color: Colors.red[700],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(children: [
                                            SizedBox(width: 10),
                                            Text(
                                              'Test Assessee',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(width: 50),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.1,
                                              child: Text(
                                                'Manufacturing,Hospatility,  Construction',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 50),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.19,
                                              child: Text(
                                                'Test Location',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              child: Text(
                                                '10',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 120),
                                            SizedBox(
                                              child: Text(
                                                '5',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 90),
                                            SizedBox(
                                              child: Text(
                                                '5',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          ]),
                                          Row(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.4,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        padding:
                                                            EdgeInsets.all(2),
                                                        child: Text(
                                                          'Plant Head:',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .grey[600]),
                                                        )),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.all(2),
                                                        child: Text(
                                                          'Plant Headhead',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                          ),
                                                        )),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.all(2),
                                                        child: Text(
                                                          'plant@mahindra.com',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14,
                                                          ),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      child: Text(
                                                        'Sector/Business Safety SPOC:',
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[600]),
                                                      )),
                                                  Container(
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      child: Text(
                                                        'Plant Headhead',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                        ),
                                                      )),
                                                  Container(
                                                      padding:
                                                          EdgeInsets.all(2),
                                                      child: Text(
                                                        'plant@mahindra.com',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14,
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ]),
                              );
                            },
                          ))
                        ]))));
  }
}
