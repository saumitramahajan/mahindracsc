import 'package:flutter/material.dart';

class SelfAssessmentUi extends StatefulWidget {
  @override
  _SelfAssessmentUiState createState() => _SelfAssessmentUiState();
}

class _SelfAssessmentUiState extends State<SelfAssessmentUi> {
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
                            child: Text(
                              'Self Assessment',
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  backgroundColor: Colors.black26),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                                  child: Text(
                                    'Statement',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(150, 10, 10, 10),
                                  child: Text(
                                    'Marks',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(100, 10, 10, 10),
                                  child: Text(
                                    'Justification',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(150, 10, 10, 10),
                                  child: Text(
                                    'FileURL',
                                    style: TextStyle(color: Colors.grey[600]),
                                  )),
                              Container(
                                  padding: EdgeInsets.fromLTRB(150, 10, 10, 10),
                                  child: Text(
                                    'Level',
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
                                        margin: EdgeInsets.fromLTRB(
                                            8.0, 8.0, 8.0, 8.0),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    10, 10, 10, 10),
                                                child: SizedBox(
                                                  width: 150,
                                                  child: Text(
                                                    'Safety Organization and Line Management Policy',
                                                    style: TextStyle(
                                                      color: Colors.red[700],
                                                      fontWeight:
                                                          FontWeight.bold,
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
                                                    SizedBox(width: 70),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: Text(
                                                        '0',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 105),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                        child: Text(
                                                          'Justification',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 70),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: SizedBox(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                        child: Text(
                                                          'NIL',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 40),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      child: SizedBox(
                                                        child: Text(
                                                          '0',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ]),
                                                ],
                                              )
                                            ]));
                                  }))
                        ]))));
  }
}
