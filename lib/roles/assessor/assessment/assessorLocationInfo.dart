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
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: SingleChildScrollView(
                          child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: <TextSpan>[
                                          TextSpan(
                                            text: 'Name of the Site:',
                                          ),
                                          TextSpan(
                                              text: ((provider.infoMap[
                                                          'siteName'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider
                                                      .infoMap['siteName']),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ]))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              children: [
                                            TextSpan(
                                                text: 'Name of the Occupier:'),
                                            TextSpan(
                                                text: ((provider.infoMap[
                                                            'occupierName'] ==
                                                        '')
                                                    ? 'Not Entered Yet'
                                                    : provider.infoMap[
                                                        'occupierName']),
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold))
                                          ])),
                                      RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                              TextSpan(
                                                  text:
                                                      'Email of the Occupier:'),
                                              TextSpan(
                                                  text: ((provider.infoMap[
                                                              'occupierEmail'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider.infoMap[
                                                          'occupierEmail']),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(
                                              text: 'Name of the Site Head:'),
                                          TextSpan(
                                              text: ((provider.infoMap[
                                                          'headName'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider
                                                      .infoMap['headName']),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(
                                              text: 'Email of the Site Head:'),
                                          TextSpan(
                                              text: ((provider.infoMap[
                                                          'headEmail'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider
                                                      .infoMap['headEmail']),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(
                                              text:
                                                  'Name of the Safety Incharge:'),
                                          TextSpan(
                                              text: ((provider.infoMap[
                                                          'safetyInchargeName'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider.infoMap[
                                                      'safetyInchargeName']),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(
                                              text:
                                                  'Email of the Safety Incharge:'),
                                          TextSpan(
                                              text: ((provider.infoMap[
                                                          'safetyInchargeEmail'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider.infoMap[
                                                      'safetyInchargeEmail']),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(
                                              text:
                                                  'Name of the Fire Incharge:'),
                                          TextSpan(
                                              text: ((provider.infoMap[
                                                          'fireInchargeName'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider.infoMap[
                                                      'fireInchargeName']),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(
                                              text:
                                                  'Email of the Fire Incharge:'),
                                          TextSpan(
                                              text: ((provider.infoMap[
                                                          'fireInchargeEmail'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider.infoMap[
                                                      'fireInchargeEmail']),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(
                                              text:
                                                  'Name of the Office Safety Incharge:'),
                                          TextSpan(
                                              text: ((provider.infoMap[
                                                          'officeSafetyInchargeName'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider.infoMap[
                                                      'officeSafetyInchargeName']),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(
                                              text:
                                                  'Email of the Office Safety Incharge:'),
                                          TextSpan(
                                              text: ((provider.infoMap[
                                                          'officeSafetyInchargeEmail'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider.infoMap[
                                                      'officeSafetyInchargeEmail']),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(
                                              text:
                                                  'Name of the Utilities Incharge:'),
                                          TextSpan(
                                              text: ((provider.infoMap[
                                                          'utilitiesName'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider.infoMap[
                                                      'utilitiesName']),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(
                                              text:
                                                  'Email of the Utilities Incharge:'),
                                          TextSpan(
                                              text: ((provider.infoMap[
                                                          'utilitiesEmail'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider.infoMap[
                                                      'utilitiesEmail']),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: [
                                        TextSpan(
                                            text:
                                                'Is your site covered under " The Manufacture, Storage, and Import of Hazardous Chemical Rules 1989":'),
                                        TextSpan(
                                            text:
                                                (provider.infoMap['ruleValue'])
                                                    ? 'Yes'
                                                    : 'No',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                  provider.infoMap['ruleValue']
                                      ? RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              children: [
                                              TextSpan(
                                                  text:
                                                      'Mention the Reason For Applicability:'),
                                              TextSpan(
                                                  text: ((provider.infoMap[
                                                              'rule'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider.infoMap['rule']
                                                          .toString()),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]))
                                      : SizedBox(),
                                ],
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: [
                                        TextSpan(
                                            text:
                                                'Is your site has LPG / Propane:'),
                                        TextSpan(
                                            text: (provider.infoMap['lpgValue'])
                                                ? 'Yes'
                                                : 'No',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                  provider.infoMap['lpgValue']
                                      ? RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              children: [
                                              TextSpan(
                                                  text: 'Quantity in Tonnes:'),
                                              TextSpan(
                                                  text: ((provider
                                                              .infoMap['lpg'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider.infoMap['lpg']
                                                          .toString()),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]))
                                      : SizedBox(),
                                ],
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: [
                                        TextSpan(
                                            text: 'Is your site has Gasoline:'),
                                        TextSpan(
                                            text: ((provider
                                                        .infoMap['gasoline'] ==
                                                    '')
                                                ? 'Not Entered Yet'
                                                : provider.infoMap['gasoline']
                                                    .toString()),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                  provider.infoMap['gasolineValue']
                                      ? RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              children: [
                                              TextSpan(text: 'Quantity in kl:'),
                                              TextSpan(
                                                  text: ((provider.infoMap[
                                                              'gasolineValue'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider.infoMap[
                                                              'gasolineValue']
                                                          .toString()),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]))
                                      : SizedBox(),
                                ],
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: [
                                        TextSpan(
                                            text:
                                                'Is your site has CNG / PNG:'),
                                        TextSpan(
                                            text:
                                                ((provider.infoMap['cng'] == '')
                                                    ? 'Not Entered Yet'
                                                    : provider.infoMap['cng']
                                                        .toString()),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                  provider.infoMap['cngValue']
                                      ? RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              children: [
                                              TextSpan(text: 'Quantity in kg:'),
                                              TextSpan(
                                                  text: ((provider.infoMap[
                                                              'cngValue'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider
                                                          .infoMap['cngValue']
                                                          .toString()),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]))
                                      : SizedBox(),
                                ],
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: [
                                        TextSpan(
                                            text:
                                                'Is your site has Paint Shop:'),
                                        TextSpan(
                                            text: ((provider
                                                        .infoMap['paintShop'] ==
                                                    '')
                                                ? 'Not Entered Yet'
                                                : provider.infoMap['paintShop']
                                                    .toString()),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                  provider.infoMap['paintShopValue']
                                      ? RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              children: [
                                              TextSpan(text: 'Capacity:'),
                                              TextSpan(
                                                  text: ((provider.infoMap[
                                                              'paintShopValue'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider.infoMap[
                                                              'paintShopValue']
                                                          .toString()),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]))
                                      : SizedBox(),
                                ],
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: [
                                        TextSpan(
                                            text:
                                                'Is your site has Melting / Foundry:'),
                                        TextSpan(
                                            text: ((provider
                                                        .infoMap['foundry'] ==
                                                    '')
                                                ? 'Not Entered Yet'
                                                : provider.infoMap['foundry']
                                                    .toString()),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                  provider.infoMap['foundryValue']
                                      ? RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              children: [
                                              TextSpan(text: 'Capacity:'),
                                              TextSpan(
                                                  text: ((provider.infoMap[
                                                              'foundryValue'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider.infoMap[
                                                              'foundryValue']
                                                          .toString()),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]))
                                      : SizedBox(),
                                ],
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: [
                                        TextSpan(
                                            text:
                                                'Is your site has Press machine:'),
                                        TextSpan(
                                            text: ((provider.infoMap['press'] ==
                                                    '')
                                                ? 'Not Entered Yet'
                                                : provider.infoMap['press']
                                                    .toString()),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                  provider.infoMap['pressValue']
                                      ? RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              children: [
                                              TextSpan(text: 'Capacity:'),
                                              TextSpan(
                                                  text: ((provider.infoMap[
                                                              'pressValue'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider
                                                          .infoMap['pressValue']
                                                          .toString()),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]))
                                      : SizedBox(),
                                ],
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: [
                                        TextSpan(
                                            text:
                                                'Is your site has diesel storage:'),
                                        TextSpan(
                                            text:
                                                ((provider.infoMap['diesel'] ==
                                                        '')
                                                    ? 'Not Entered Yet'
                                                    : provider.infoMap['diesel']
                                                        .toString()),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                  provider.infoMap['dieselValue']
                                      ? RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              children: [
                                              TextSpan(text: 'Quantity in kl:'),
                                              TextSpan(
                                                  text: ((provider.infoMap[
                                                              'dieselValue'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider.infoMap[
                                                              'dieselValue']
                                                          .toString()),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]))
                                      : SizedBox(),
                                ],
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: [
                                        TextSpan(
                                            text:
                                                'Is your site has Thinner / other Class A Storage:'),
                                        TextSpan(
                                            text: ((provider
                                                        .infoMap['thinner'] ==
                                                    '')
                                                ? 'Not Entered Yet'
                                                : provider.infoMap['thinner']
                                                    .toString()),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                  provider.infoMap['thinnerValue']
                                      ? RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              children: [
                                              TextSpan(text: 'Quantity in kl:'),
                                              TextSpan(
                                                  text: ((provider.infoMap[
                                                              'thinnerValue'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider.infoMap[
                                                              'thinnerValue']
                                                          .toString()),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]))
                                      : SizedBox(),
                                ],
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: [
                                        TextSpan(
                                            text:
                                                'Is your site has Toxic Chemicals:'),
                                        TextSpan(
                                            text: ((provider.infoMap['toxic'] ==
                                                    '')
                                                ? 'Not Entered Yet'
                                                : provider.infoMap['toxic']
                                                    .toString()),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                  provider.infoMap['toxicValue']
                                      ? RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              children: [
                                              TextSpan(
                                                  text: 'Quantity and Name:'),
                                              TextSpan(
                                                  text: ((provider.infoMap[
                                                              'toxicValue'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider
                                                          .infoMap['toxicValue']
                                                          .toString()),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]))
                                      : SizedBox(),
                                ],
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: [
                                        TextSpan(
                                            text:
                                                'Is your site has Heat treatment:'),
                                        TextSpan(
                                            text: ((provider.infoMap['heat'] ==
                                                    '')
                                                ? 'Not Entered Yet'
                                                : provider.infoMap['heat']
                                                    .toString()),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                  provider.infoMap['heatValue']
                                      ? RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              children: [
                                              TextSpan(text: 'Capacity:'),
                                              TextSpan(
                                                  text: ((provider.infoMap[
                                                              'heatValue'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider
                                                          .infoMap['heatValue']
                                                          .toString()),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]))
                                      : SizedBox(),
                                ],
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: [
                                        TextSpan(
                                            text: 'Is your site has Test Bed:'),
                                        TextSpan(
                                            text: (provider
                                                    .infoMap['testBedValue'])
                                                ? 'Yes'
                                                : 'No',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                  provider.infoMap['testBedValue']
                                      ? RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              children: [
                                              TextSpan(text: 'Nos:'),
                                              TextSpan(
                                                  text: ((provider.infoMap[
                                                              'testBed'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider
                                                          .infoMap['testBed']
                                                          .toString()),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]))
                                      : SizedBox(),
                                ],
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Card(
                                child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                          children: [
                                        TextSpan(
                                            text:
                                                'Is your site has Boiler - is it covered under IBR ( Indian Boiler Regulation):'),
                                        TextSpan(
                                            text:
                                                ((provider.infoMap['ibr'] == '')
                                                    ? 'Not Entered Yet'
                                                    : provider.infoMap['ibr']
                                                        .toString()),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold))
                                      ])),
                                  provider.infoMap['ibrValue']
                                      ? RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              children: [
                                              TextSpan(
                                                  text:
                                                      'Number and their Capacity:'),
                                              TextSpan(
                                                  text: ((provider.infoMap[
                                                              'ibrValue'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider
                                                          .infoMap['ibrValue']
                                                          .toString()),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold))
                                            ]))
                                      : SizedBox(),
                                ],
                              ),
                            )),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.7,
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
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(text: 'Fatal(Nos):'),
                                          TextSpan(
                                              text: ((provider
                                                          .infoMap['fatal'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider.infoMap['fatal']
                                                      .toString()),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(text: 'Reportable(Nos):'),
                                          TextSpan(
                                              text: ((provider.infoMap[
                                                          'reportable'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider
                                                      .infoMap['reportable']
                                                      .toString()),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(
                                              text: 'Non-Reportable(Nos):'),
                                          TextSpan(
                                              text: ((provider.infoMap[
                                                          'nonReportable'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider
                                                      .infoMap['nonReportable']
                                                      .toString()),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(
                                              text: 'First Aid Cases(Nos):'),
                                          TextSpan(
                                              text: ((provider.infoMap[
                                                          'firstAid'] ==
                                                      '')
                                                  ? 'Not Entered Yet'
                                                  : provider.infoMap['firstAid']
                                                      .toString()),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                            children: [
                                          TextSpan(
                                              text: 'Fire Incidents(Nos):'),
                                          TextSpan(
                                              text:
                                                  ((provider.infoMap['fire'] ==
                                                          '')
                                                      ? 'Not Entered Yet'
                                                      : provider.infoMap['fire']
                                                          .toString()),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold))
                                        ])),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          RaisedButton(
                              child: Text('Next'),
                              onPressed: () {
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                  builder: (context) => SiteAssessment(
                                      'site', provider.locationId),
                                ));
                              })
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
