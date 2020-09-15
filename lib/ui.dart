import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListOfLocations extends StatefulWidget {
  @override
  _ListOfLocationsState createState() => _ListOfLocationsState();
}

class _ListOfLocationsState extends State<ListOfLocations> {
  bool loading = false;
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
        ),
        body: Center(
            child: loading
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
                                        CrossAxisAlignment.start,
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
