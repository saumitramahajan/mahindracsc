import 'package:mahindraCSC/assessments/siteAssessment/siteAssessment.dart';
import 'package:mahindraCSC/utilities.dart';

import 'assessorLocationInfoprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssessorLocationInfo extends StatefulWidget {
  @override
  _AssessorLocationInfoState createState() => _AssessorLocationInfoState();
}

class _AssessorLocationInfoState extends State<AssessorLocationInfo> {
  Utilities utilities = Utilities();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AssessmentLocationInfoProvider>(context);

    return Stack(
      children: [
        Scaffold(
            appBar: AppBar(
              backgroundColor: utilities.mainColor,
              titleSpacing: 0.0,
              automaticallyImplyLeading: false,
            ),
            body: (provider.loading)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Name Of the Site',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(width: 20),
                                        Text(
                                          ((provider.infoMap['siteName'] == '')
                                              ? ''
                                              : provider.infoMap['siteName']
                                                  .toString()),
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    decoration: new BoxDecoration(
                                      borderRadius:
                                          new BorderRadius.circular(5.0),
                                      color: Colors.red[700],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: Card(
                                  child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('Occupier',
                                                      style: TextStyle(
                                                          color: Colors.grey)),
                                                  SizedBox(height: 30),
                                                  Text('Site Head',
                                                      style: TextStyle(
                                                          color: Colors.grey)),
                                                  SizedBox(height: 30),
                                                  Text('Safety Incharge',
                                                      style: TextStyle(
                                                          color: Colors.grey)),
                                                ],
                                              ),
                                              SizedBox(
                                                width: 40,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    ((provider.infoMap[
                                                                'occupierName'] ==
                                                            '')
                                                        ? ''
                                                        : provider.infoMap[
                                                            'occupierName']),
                                                  ),
                                                  Text(
                                                    ((provider.infoMap[
                                                                'occupierEmail'] ==
                                                            '')
                                                        ? ''
                                                        : provider.infoMap[
                                                            'occupierEmail']),
                                                  ),
                                                  SizedBox(height: 30),
                                                  Text(
                                                    ((provider.infoMap[
                                                                'headName'] ==
                                                            '')
                                                        ? ''
                                                        : provider.infoMap[
                                                            'headName']),
                                                  ),
                                                  Text(
                                                    ((provider.infoMap[
                                                                'headEmail'] ==
                                                            '')
                                                        ? ''
                                                        : provider.infoMap[
                                                            'headEmail']),
                                                  ),
                                                  SizedBox(height: 30),
                                                  Text(
                                                    ((provider.infoMap[
                                                                'safetyInchargeName'] ==
                                                            '')
                                                        ? ''
                                                        : provider.infoMap[
                                                            'safetyInchargeName']),
                                                  ),
                                                  Text(
                                                    ((provider.infoMap[
                                                                'safetyInchargeEmail'] ==
                                                            '')
                                                        ? ''
                                                        : provider.infoMap[
                                                            'safetyInchargeEmail']),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]),
                                    SizedBox(width: 200),
                                    Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Fire Incharge',
                                                    style: TextStyle(
                                                        color: Colors.grey)),
                                                SizedBox(height: 30),
                                                Text('Office Safety Incharge',
                                                    style: TextStyle(
                                                        color: Colors.grey)),
                                                SizedBox(height: 30),
                                                Text('Utilities Incharge',
                                                    style: TextStyle(
                                                        color: Colors.grey)),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 40,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  ((provider.infoMap[
                                                              'fireInchargeName'] ==
                                                          '')
                                                      ? ''
                                                      : provider.infoMap[
                                                          'fireInchargeName']),
                                                ),
                                                Text(
                                                  ((provider.infoMap[
                                                              'fireInchargeEmail'] ==
                                                          '')
                                                      ? ''
                                                      : provider.infoMap[
                                                          'fireInchargeEmail']),
                                                ),
                                                SizedBox(height: 30),
                                                Text(
                                                  ((provider.infoMap[
                                                              'officeSafetyInchargeName'] ==
                                                          '')
                                                      ? ''
                                                      : provider.infoMap[
                                                          'officeSafetyInchargeName']),
                                                ),
                                                Text(
                                                  ((provider.infoMap[
                                                              'officeSafetyInchargeEmail'] ==
                                                          '')
                                                      ? ''
                                                      : provider.infoMap[
                                                          'officeSafetyInchargeEmail']),
                                                ),
                                                SizedBox(height: 30),
                                                Text(
                                                  ((provider.infoMap[
                                                              'utilitiesName'] ==
                                                          '')
                                                      ? ''
                                                      : provider.infoMap[
                                                          'utilitiesName']),
                                                ),
                                                Text(
                                                  ((provider.infoMap[
                                                              'utilitiesEmail'] ==
                                                          '')
                                                      ? ''
                                                      : provider.infoMap[
                                                          'utilitiesEmail']),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ))),
                          Container(
                              width: MediaQuery.of(context).size.width * 0.95,
                              child: Card(
                                child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Does your site covered under " The Manufacture, Storage, and Import of Hazardous Chemical Rules 1989"?',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            ((provider.infoMap['ruleValue'] ==
                                                    true)
                                                ? 'Yes'
                                                : 'No'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          (provider.infoMap['ruleValue'])
                                              ? SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Mention the Reason For Applicability:',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        ((provider.infoMap[
                                                                    'rule'] ==
                                                                '')
                                                            ? ''
                                                            : provider
                                                                .infoMap['rule']
                                                                .toString()),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Does your site has LPG/Propane?',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            ((provider.infoMap['lpgValue'] ==
                                                    true)
                                                ? 'Yes'
                                                : 'No'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          (provider.infoMap['lpgValue'])
                                              ? SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Quantitiy in Tonnes:',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        ((provider.infoMap[
                                                                    'lpg'] ==
                                                                '')
                                                            ? ''
                                                            : provider
                                                                .infoMap['lpg']
                                                                .toString()),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Does your site has Gasoline?',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            ((provider.infoMap[
                                                        'gasolineValue'] ==
                                                    true)
                                                ? 'Yes'
                                                : 'No'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          (provider.infoMap['gasolineValue'])
                                              ? SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Quantitiy in kl:',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        ((provider.infoMap[
                                                                    'gasoline'] ==
                                                                '')
                                                            ? ''
                                                            : provider.infoMap[
                                                                    'gasoline']
                                                                .toString()),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Does your site has CNG/PNG?',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            ((provider.infoMap['cngValue'] ==
                                                    true)
                                                ? 'Yes'
                                                : 'No'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          (provider.infoMap['cngValue'])
                                              ? SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Quantitiy in kg:',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        ((provider.infoMap[
                                                                    'cng'] ==
                                                                '')
                                                            ? ''
                                                            : provider
                                                                .infoMap['cng']
                                                                .toString()),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Does your site has Paint Shop?',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            ((provider.infoMap[
                                                        'paintShopValue'] ==
                                                    true)
                                                ? 'Yes'
                                                : 'No'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          (provider.infoMap['paintShopValue'])
                                              ? SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Capacity:',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        ((provider.infoMap[
                                                                    'paintShop'] ==
                                                                '')
                                                            ? ''
                                                            : provider.infoMap[
                                                                    'paintShop']
                                                                .toString()),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Does your site has Melting/Foundry?',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            ((provider.infoMap[
                                                        'foundryValue'] ==
                                                    true)
                                                ? 'Yes'
                                                : 'No'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          (provider.infoMap['foundryValue'])
                                              ? SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Capacity:',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        ((provider.infoMap[
                                                                    'foundry'] ==
                                                                '')
                                                            ? ''
                                                            : provider.infoMap[
                                                                    'foundry']
                                                                .toString()),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Does your site has Press Machine?',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            ((provider.infoMap['pressValue'] ==
                                                    true)
                                                ? 'Yes'
                                                : 'No'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          (provider.infoMap['pressValue'])
                                              ? SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Capacity:',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        ((provider.infoMap[
                                                                    'press'] ==
                                                                '')
                                                            ? ''
                                                            : provider.infoMap[
                                                                    'press']
                                                                .toString()),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Does your site has diesel Storage?',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            ((provider.infoMap['dieselValue'] ==
                                                    true)
                                                ? 'Yes'
                                                : 'No'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          (provider.infoMap['dieselValue'])
                                              ? SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Quantitiy in kl:',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        ((provider.infoMap[
                                                                    'diesel'] ==
                                                                '')
                                                            ? ''
                                                            : provider.infoMap[
                                                                    'diesel']
                                                                .toString()),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Does your site has thinner/Other Class A storage?',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            ((provider.infoMap[
                                                        'thinnerValue'] ==
                                                    true)
                                                ? 'Yes'
                                                : 'No'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          (provider.infoMap['thinnerValue'])
                                              ? SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Quantitiy in kl:',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        ((provider.infoMap[
                                                                    'thinner'] ==
                                                                '')
                                                            ? ''
                                                            : provider.infoMap[
                                                                    'thinner']
                                                                .toString()),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Does your site has Toxic Chemicals?',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            ((provider.infoMap['toxicValue'] ==
                                                    true)
                                                ? 'Yes'
                                                : 'No'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          (provider.infoMap['toxicValue'])
                                              ? SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Quantitiy and Name:',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        ((provider.infoMap[
                                                                    'toxic'] ==
                                                                '')
                                                            ? ''
                                                            : provider.infoMap[
                                                                    'toxic']
                                                                .toString()),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Does your site has Heat Treatment?',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            ((provider.infoMap['heatValue'] ==
                                                    true)
                                                ? 'Yes'
                                                : 'No'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          (provider.infoMap['heatValue'])
                                              ? SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Quantitiy and Name:',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        ((provider.infoMap[
                                                                    'heat'] ==
                                                                '')
                                                            ? ''
                                                            : provider
                                                                .infoMap['heat']
                                                                .toString()),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Does your site has Test Bed?',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            ((provider.infoMap[
                                                        'testBedValue'] ==
                                                    true)
                                                ? 'Yes'
                                                : 'No'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          (provider.infoMap['testBedValue'])
                                              ? SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Nos:',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        ((provider.infoMap[
                                                                    'testBed'] ==
                                                                '')
                                                            ? ''
                                                            : provider.infoMap[
                                                                    'testBed']
                                                                .toString()),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text(
                                            'Does your site has Boiler?Does it covered under IBR(Indian Boiler Regulation)?',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(
                                            ((provider.infoMap['ibrValue'] ==
                                                    true)
                                                ? 'Yes'
                                                : 'No'),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          (provider.infoMap['ibrValue'])
                                              ? SizedBox(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Number and their capacity:',
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      ),
                                                      Text(
                                                        ((provider.infoMap[
                                                                    'ibr'] ==
                                                                '')
                                                            ? ''
                                                            : provider
                                                                .infoMap['ibr']
                                                                .toString()),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              : SizedBox(),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ])),
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.95,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Incident Statistics',
                                        style: TextStyle(
                                          fontSize: 20.0,
                                        )),
                                    SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Fatal(Nos):',
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            Text('Reportable(Nos):',
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            Text('Non-Reportable(Nos):',
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            Text('First Aid Cases(Nos):',
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                            Text('Fire Incident(Nos):',
                                                style: TextStyle(
                                                    color: Colors.grey)),
                                          ],
                                        ),
                                        SizedBox(width: 10),
                                        Column(
                                          children: [
                                            Text(
                                              ((provider.infoMap['fatal'] == '')
                                                  ? ''
                                                  : provider.infoMap['fatal']
                                                      .toString()),
                                            ),
                                            Text(
                                              ((provider.infoMap[
                                                          'reportable'] ==
                                                      '')
                                                  ? ''
                                                  : provider
                                                      .infoMap['reportable']
                                                      .toString()),
                                            ),
                                            Text(
                                              ((provider.infoMap[
                                                          'nonReportable'] ==
                                                      '')
                                                  ? ''
                                                  : provider
                                                      .infoMap['nonReportable']
                                                      .toString()),
                                            ),
                                            Text(
                                              ((provider.infoMap['firstAid'] ==
                                                      '')
                                                  ? ''
                                                  : provider.infoMap['firstAid']
                                                      .toString()),
                                            ),
                                            Text(
                                              ((provider.infoMap['fire'] == '')
                                                  ? ''
                                                  : provider.infoMap['fire']
                                                      .toString()),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          RaisedButton(child: Text('Next'), onPressed: () {})
                        ],
                      )),
                    ),
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
}
