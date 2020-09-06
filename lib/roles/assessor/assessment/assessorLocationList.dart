import 'package:mahindraCSC/roles/assessor/assessment/assessorLocationInfoBase.dart';

import 'assessorLocationListProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssessorLocationListInfo extends StatefulWidget {
  @override
  _AssessorLocationListInfo createState() => _AssessorLocationListInfo();
}

class _AssessorLocationListInfo extends State<AssessorLocationListInfo> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AssessorLocationListInfoProvider>(context);
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: provider.loading
                ? CircularProgressIndicator()
                : Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(children: [
                      Text(
                        ' Choose Location:',
                        style: TextStyle(fontSize: 25),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: provider.listOfAssessorLocation.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                child: Card(
                                  elevation: 5.0,
                                  margin:
                                      EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          padding: EdgeInsets.fromLTRB(
                                              10, 10, 10, 10),
                                          child: Column(children: [
                                            Text(
                                                provider.listOfAssessorLocation[
                                                    index]['location']),
                                          ])),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  print(provider.listOfAssessorLocation[index]
                                      ['locationId']);
                                  Navigator.of(context)
                                      .pushReplacement(MaterialPageRoute(
                                    builder: (context) => AssessorInfo(
                                      cycleId:
                                          provider.listOfAssessorLocation[index]
                                              ['locationId'],
                                    ),
                                  ));
                                },
                              );
                            }),
                      ),
                    ]),
                  )));
  }
}
