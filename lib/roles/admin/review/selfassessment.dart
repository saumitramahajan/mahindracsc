import '../../../utilities.dart';
import 'assessmentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class SelfAssessment extends StatefulWidget {
  String documentId;
  SelfAssessment({Key key, @required this.documentId}) : super(key: key);
  @override
  _SelfAssessmentState createState() => _SelfAssessmentState();
}

class _SelfAssessmentState extends State<SelfAssessment> {
  String groupValue = '1';
  Widget displayContainer = Container();
  Utilities utilities = Utilities();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AssessmentProvider>(context);

    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              backgroundColor: utilities.mainColor,
              titleSpacing: 0.0,
              automaticallyImplyLeading: false,
            ),
            body: (provider.dataLoading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(children: [
                            SizedBox(
                              width: 150,
                            ),
                            (provider.assessmentType == 'self')
                                ? Text(
                                    "Self Assessment",
                                    style: TextStyle(fontSize: 25),
                                  )
                                : Text('Site Assessment',
                                    style: TextStyle(fontSize: 25)),
                            SizedBox(
                              width: 40,
                            ),
                            DropdownButton(
                                value: groupValue,
                                items: [
                                  DropdownMenuItem(
                                    child: Text("Process Parameter"),
                                    value: '1',
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Result Parameter"),
                                    value: '2',
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Fire Safety Assessment"),
                                    value: '3',
                                  ),
                                  DropdownMenuItem(
                                    child: Text("Office Safety Assessment"),
                                    value: '4',
                                  )
                                ],
                                onChanged: (value) {
                                  setState(() {
                                    groupValue = value;
                                    if (provider.assessmentType == 'self') {
                                      switch (groupValue) {
                                        case '1':
                                          {
                                            displayContainer =
                                                selfProcessContainer(provider);
                                          }
                                          break;
                                        case '2':
                                          {
                                            displayContainer =
                                                selfResultContainer(provider);
                                          }
                                          break;
                                        case '3':
                                          {
                                            displayContainer =
                                                selfFireContainer(provider);
                                          }
                                          break;
                                        case '4':
                                          {
                                            displayContainer =
                                                selfOfficeContainer(provider);
                                          }
                                          break;
                                      }
                                    } else {
                                      switch (groupValue) {
                                        case '1':
                                          {
                                            displayContainer =
                                                siteProcessContainer(provider);
                                          }
                                          break;
                                        case '2':
                                          {
                                            displayContainer =
                                                siteResultContainer(provider);
                                          }
                                          break;
                                        case '3':
                                          {
                                            displayContainer =
                                                siteFireContainer(provider);
                                          }
                                          break;
                                        case '4':
                                          {
                                            displayContainer =
                                                siteOfficeContainer(provider);
                                          }
                                          break;
                                      }
                                    }
                                  });
                                }),
                          ]),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              (groupValue != '1')
                                  ? displayContainer
                                  : (provider.assessmentType == 'self'
                                      ? selfProcessContainer(provider)
                                      : siteProcessContainer(provider))
                            ],
                          ),
                        )
                      ])),
        SizedBox(
          height: AppBar().preferredSize.height * 2,
          child: Image.asset(
            'assets/mahindraAppBar.png',
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }

  Widget selfProcessContainer(AssessmentProvider provider) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Column(
          children: [
            Text(
              'Process Parameters',
              style: TextStyle(fontSize: 20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Text(
                        'Statement',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(170, 10, 10, 10),
                      child: Text(
                        'Level',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(100, 10, 10, 10),
                      child: Text(
                        'Justification',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(140, 10, 10, 10),
                      child: Text(
                        'View File',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .65,
              child: ListView.builder(
                itemCount: provider.listOfStatement.length,
                itemBuilder: (context, index) {
                  return (index < 25)
                      ? Card(
                          elevation: 5.0,
                          margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: SizedBox(
                                      width: 180,
                                      child: Text(
                                        provider.listOfStatement[index]
                                            ['statement'],
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
                                        SizedBox(width: 70),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            provider.listOfAssessment[index]
                                                ['level'],
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 105),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: ReadMoreText(
                                              provider.listOfAssessment[index]
                                                      ['comment'] +
                                                  'hjhsghfgdseadsghhtgytuhgtdscbvhjjkyuyttredsgfhjguyijhhftrdresfxfghgytryhhgfgcdsdxfgfhgjghgfgffggfggfgftfhfg',
                                              trimLines: 3,
                                              colorClickableText: Colors.red,
                                              trimMode: TrimMode.Line,
                                              trimCollapsedText: '...Show more',
                                              trimExpandedText: ' show less',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 70),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
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
                                      ]),
                                    ],
                                  )
                                ]),
                          ))
                      : SizedBox();
                },
              ),
            )
          ],
        ));
  }

  Widget selfResultContainer(AssessmentProvider provider) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Column(
          children: [
            Text(
              'Result Parameters',
              style: TextStyle(fontSize: 20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Text(
                        'Statement',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(190, 10, 10, 10),
                      child: Text(
                        'Level',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(100, 10, 10, 10),
                      child: Text(
                        'Justification',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(140, 10, 10, 10),
                      child: Text(
                        'View File',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .65,
              child: ListView.builder(
                itemCount: provider.listOfStatement.length,
                itemBuilder: (context, index) {
                  return (index > 24)
                      ? Card(
                          elevation: 5.0,
                          margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: SizedBox(
                                      width: 200,
                                      child: Text(
                                        provider.listOfStatement[index]
                                            ['statement'],
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
                                        SizedBox(width: 70),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            provider.listOfAssessment[index]
                                                ['level'],
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 105),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: ReadMoreText(
                                              provider.listOfAssessment[index]
                                                      ['comment'] +
                                                  'hjhsghfgdseadsghhtgytuhgtdscbvhjjkyuyttredsgfhjguyijhhftrdresfxfghgytryhhgfgcdsdxfgfhgjghgfgffggfggfgftfhfg',
                                              trimLines: 3,
                                              colorClickableText: Colors.red,
                                              trimMode: TrimMode.Line,
                                              trimCollapsedText: '...Show more',
                                              trimExpandedText: ' show less',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 70),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
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
                                      ]),
                                    ],
                                  )
                                ]),
                          ))
                      : SizedBox();
                },
              ),
            )
          ],
        ));
  }

  Widget selfFireContainer(AssessmentProvider provider) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Column(
          children: [
            Text(
              'Fire Safety Assessment',
              style: TextStyle(fontSize: 20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Text(
                        'Statement',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(280, 10, 10, 10),
                      child: Text(
                        'Response',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(100, 10, 10, 10),
                      child: Text(
                        'Justification',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .65,
              child: ListView.builder(
                itemCount: provider.listOfStatementFire.length,
                itemBuilder: (context, index) {
                  return (index < 25)
                      ? Card(
                          elevation: 5.0,
                          margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: SizedBox(
                                      width: 300,
                                      child: Text(
                                        provider.listOfStatementFire[index]
                                            ['statement'],
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
                                        SizedBox(width: 70),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            (provider.listOfFireAssessment[
                                                        index]['answer'] ==
                                                    'no')
                                                ? 'No'
                                                : 'Yes',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 105),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: ReadMoreText(
                                              provider.listOfAssessment[index]
                                                      ['comment'] +
                                                  'hjhsghfgdseadsghhtgytuhgtdscbvhjjkyuyttredsgfhjguyijhhftrdresfxfghgytryhhgfgcdsdxfgfhgjghgfgffggfggfgftfhfg',
                                              trimLines: 3,
                                              colorClickableText: Colors.red,
                                              trimMode: TrimMode.Line,
                                              trimCollapsedText: '...Show more',
                                              trimExpandedText: ' show less',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  )
                                ]),
                          ))
                      : SizedBox();
                },
              ),
            )
          ],
        ));
  }

  Widget selfOfficeContainer(AssessmentProvider provider) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Column(
          children: [
            Text(
              'Office Safety Assessment',
              style: TextStyle(fontSize: 20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Text(
                        'Statement',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(520, 10, 10, 10),
                      child: Text(
                        'Response',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .65,
              child: ListView.builder(
                itemCount: provider.listOfStatementOffice.length,
                itemBuilder: (context, index) {
                  return (true)
                      ? Card(
                          elevation: 5.0,
                          margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: SizedBox(
                                      width: 540,
                                      child: Text(
                                        provider.listOfStatementOffice[index]
                                            ['statement'],
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
                                        SizedBox(width: 120),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            (provider.listOfOfficeAssessment[
                                                        index]['answer'] ==
                                                    'no')
                                                ? 'No'
                                                : 'Yes',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  )
                                ]),
                          ))
                      : SizedBox();
                },
              ),
            )
          ],
        ));
  }

  Widget siteProcessContainer(AssessmentProvider provider) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Column(
          children: [
            Text(
              'Process Parameters',
              style: TextStyle(fontSize: 20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Text(
                        'Statement',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(170, 10, 10, 10),
                      child: Text(
                        'Marks',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(50, 10, 10, 10),
                      child: Text(
                        'Level',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(80, 10, 10, 10),
                      child: Text(
                        'Observations',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(120, 10, 10, 10),
                      child: Text(
                        'Suggestions',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(130, 10, 10, 10),
                      child: Text(
                        'View File',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .65,
              child: ListView.builder(
                itemCount: provider.listOfStatement.length,
                itemBuilder: (context, index) {
                  return (index < 25)
                      ? Card(
                          elevation: 5.0,
                          margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: SizedBox(
                                      width: 200,
                                      child: Text(
                                        provider.listOfStatement[index]
                                            ['statement'],
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
                                        SizedBox(width: 50),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            provider.listOfAssessment[index]
                                                ['level'],
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 75),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            provider.listOfAssessment[index]
                                                    ['answer']
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 80),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: ReadMoreText(
                                              provider.listOfAssessment[index]
                                                      ['comment'] +
                                                  'hjhsghfgdseadsghhtgytuhgtdscbvhjjkyuyttredsgfhjguyijhhftrdresfxfghgytryhhgfgcdsdxfgfhgjghgfgffggfggfgftfhfg',
                                              trimLines: 3,
                                              colorClickableText: Colors.red,
                                              trimMode: TrimMode.Line,
                                              trimCollapsedText: '...Show more',
                                              trimExpandedText: ' show less',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 50),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: ReadMoreText(
                                              provider.listOfAssessment[index]
                                                      ['suggestion'] +
                                                  'hjhsghfgdseadsghhtgytuhgtdscbvhjjkyuyttredsgfhjguyijhhftrdresfxfghgytryhhgfgcdsdxfgfhgjghgfgffggfggfgftfhfg',
                                              trimLines: 3,
                                              colorClickableText: Colors.red,
                                              trimMode: TrimMode.Line,
                                              trimCollapsedText: '...Show more',
                                              trimExpandedText: ' show less',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 70),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
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
                                      ]),
                                    ],
                                  )
                                ]),
                          ))
                      : SizedBox();
                },
              ),
            )
          ],
        ));
  }

  Widget siteResultContainer(AssessmentProvider provider) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Column(
          children: [
            Text(
              'Result Parameters',
              style: TextStyle(fontSize: 20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Text(
                        'Statement',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(190, 10, 10, 10),
                      child: Text(
                        'Marks',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(50, 10, 10, 10),
                      child: Text(
                        'Level',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(70, 10, 10, 10),
                      child: Text(
                        'Observations',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(130, 10, 10, 10),
                      child: Text(
                        'Suggestions',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(130, 10, 10, 10),
                      child: Text(
                        'View File',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .65,
              child: ListView.builder(
                itemCount: provider.listOfStatement.length,
                itemBuilder: (context, index) {
                  return (index > 24)
                      ? Card(
                          elevation: 5.0,
                          margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: SizedBox(
                                      width: 200,
                                      child: Text(
                                        provider.listOfStatement[index]
                                            ['statement'],
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
                                        SizedBox(width: 70),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            provider.listOfAssessment[index]
                                                ['level'],
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 75),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            provider.listOfAssessment[index]
                                                    ['answer']
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 75),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: ReadMoreText(
                                              provider.listOfAssessment[index]
                                                      ['comment'] +
                                                  'hjhsghfgdseadsghhtgytuhgtdscbvhjjkyuyttredsgfhjguyijhhftrdresfxfghgytryhhgfgcdsdxfgfhgjghgfgffggfggfgftfhfg',
                                              trimLines: 3,
                                              colorClickableText: Colors.red,
                                              trimMode: TrimMode.Line,
                                              trimCollapsedText: '...Show more',
                                              trimExpandedText: ' show less',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 50),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: ReadMoreText(
                                              provider.listOfAssessment[index]
                                                      ['suggestion'] +
                                                  'hjhsghfgdseadsghhtgytuhgtdscbvhjjkyuyttredsgfhjguyijhhftrdresfxfghgytryhhgfgcdsdxfgfhgjghgfgffggfggfgftfhfg',
                                              trimLines: 3,
                                              colorClickableText: Colors.red,
                                              trimMode: TrimMode.Line,
                                              trimCollapsedText: '...Show more',
                                              trimExpandedText: ' show less',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 70),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
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
                                      ]),
                                    ],
                                  )
                                ]),
                          ))
                      : SizedBox();
                },
              ),
            )
          ],
        ));
  }

  Widget siteFireContainer(AssessmentProvider provider) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Column(
          children: [
            Text(
              'Fire Safety Assessment',
              style: TextStyle(fontSize: 20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Text(
                        'Statement',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(280, 10, 10, 10),
                      child: Text(
                        'Marks',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(90, 10, 10, 10),
                      child: Text(
                        'Response',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(70, 10, 10, 10),
                      child: Text(
                        'Observations',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .65,
              child: ListView.builder(
                itemCount: provider.listOfStatementFire.length,
                itemBuilder: (context, index) {
                  return (true)
                      ? Card(
                          elevation: 5.0,
                          margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: SizedBox(
                                      width: 300,
                                      child: Text(
                                        provider.listOfStatementFire[index]
                                            ['statement'],
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
                                        SizedBox(width: 60),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            provider.listOfFireAssessment[index]
                                                    ['marks']
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 120),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            (provider.listOfFireAssessment[
                                                        index]['answer'] ==
                                                    'no')
                                                ? 'No'
                                                : 'Yes',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 90),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            child: ReadMoreText(
                                              provider.listOfAssessment[index]
                                                      ['comment'] +
                                                  'hjhsghfgdseadsghhtgytuhgtdscbvhjjkyuyttredsgfhjguyijhhftrdresfxfghgytryhhgfgcdsdxfgfhgjghgfgffggfggfgftfhfg',
                                              trimLines: 3,
                                              colorClickableText: Colors.red,
                                              trimMode: TrimMode.Line,
                                              trimCollapsedText: '...Show more',
                                              trimExpandedText: ' show less',
                                              style: TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  )
                                ]),
                          ))
                      : SizedBox();
                },
              ),
            )
          ],
        ));
  }

  Widget siteOfficeContainer(AssessmentProvider provider) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Column(
          children: [
            Text(
              'Office Safety Assessment',
              style: TextStyle(fontSize: 20),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: Text(
                        'Statement',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(700, 10, 10, 10),
                      child: Text(
                        'Marks',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(160, 10, 10, 10),
                      child: Text(
                        'Response',
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .65,
              child: ListView.builder(
                itemCount: provider.listOfStatementOffice.length,
                itemBuilder: (context, index) {
                  return (true)
                      ? Card(
                          elevation: 5.0,
                          margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 10),
                                    child: SizedBox(
                                      width: 550,
                                      child: Text(
                                        provider.listOfStatementOffice[index]
                                            ['statement'],
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
                                        SizedBox(width: 100),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            provider
                                                .listOfOfficeAssessment[index]
                                                    ['marks']
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 100),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Text(
                                            (provider.listOfOfficeAssessment[
                                                        index]['answer'] ==
                                                    'no')
                                                ? 'No'
                                                : 'Yes',
                                            style: TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ],
                                  )
                                ]),
                          ))
                      : SizedBox();
                },
              ),
            )
          ],
        ));
  }
}
/* child: Column(
                children: [
                  Expanded(
                      child: CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        title: (provider.assessmentType == 'self')
                            ? Text("Self Assessment")
                            : Text('Site Assessment'),
                        expandedHeight: 30.0,
                        pinned: false,
                        floating: false,
                        flexibleSpace: FlexibleSpaceBar(),
                      ),
                      /* Row(
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
                                'level',
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
                                'View file',
                                style: TextStyle(color: Colors.grey[600]),
                              )),
                          
                        ],
                      )*/
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (BuildContext context, index) {
                          return Container(
                            child: new Card(
                                elevation: 5.0,
                                margin:
                                    EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
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
                                            SizedBox(width: 70),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Text(
                                                '0',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 105),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
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
                                              padding: EdgeInsets.all(10),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
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
                                          ]),
                                        ],
                                      )
                                    ])),
                          );
                        },
                        childCount: 1,
                      )),
                      /*SliverAppBar(
                        title: (provider.assessmentType == 'self')
                            ? Text("Self Assessment Fire")
                            : Text('Site Assessment Fire'),
                        expandedHeight: 70.0,
                        pinned: false,
                        floating: false,
                        flexibleSpace: FlexibleSpaceBar(),
                      ),
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (BuildContext context, index) {
                          return Container(
                            child: new Card(
                              elevation: 5.0,
                              margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Statement:' +
                                                provider.listOfStatementFire[
                                                    index]['statement']),
                                            Text('Response:' +
                                                provider.listOfFireAssessment[
                                                        index]['answer']
                                                    .toString()),
                                            Text('Justification:' +
                                                provider.listOfFireAssessment[
                                                    index]['comment']),
                                          ])),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: provider.listOfFireAssessment.length,
                      )),
                      SliverAppBar(
                        title: (provider.assessmentType == 'self')
                            ? Text("Self Assessment office")
                            : Text('Site Assessment office'),
                        expandedHeight: 70.0,
                        pinned: false,
                        floating: false,
                        flexibleSpace: FlexibleSpaceBar(),
                      ),
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (BuildContext context, index) {
                          return Container(
                            child: new Card(
                              elevation: 5.0,
                              margin: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Statement:' +
                                                provider.listOfStatementOffice[
                                                    index]['statement']),
                                            Text('Response' +
                                                provider
                                                    .listOfOfficeAssessment[
                                                        index]
                                                    .toString()),
                                          ])),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: provider.listOfOfficeAssessment.length,
                      )),
                    ],
                  )),
                  (provider.assessmentType != 'self')
                      ? RaisedButton(
                          child: Text('Close Assessment'),
                          onPressed: () async {
                            await Firestore.instance
                                .collection('cycles')
                                .document(widget.documentId)
                                .updateData({'currentStatus': 'Closed'});
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Dashboard()));
                          })
                      : SizedBox(),*/
                ],
              )*/
