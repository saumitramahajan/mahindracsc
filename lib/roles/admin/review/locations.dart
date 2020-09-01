import 'selfassessment.dart';
import 'assessmentProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Locations extends StatefulWidget {
  @override
  _LocationsState createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AssessmentProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Locations'),
        ),
        body: Center(
            child: provider.loading
                ? CircularProgressIndicator()
                : Container(
                    child: Column(children: [
                      Text(
                        'Locations:',
                        style: TextStyle(fontSize: 25),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: provider.listOfLocations.length,
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
                                            Text(provider.listOfLocations[index]
                                                ['location']),
                                          ])),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  provider.locations(provider
                                      .listOfLocations[index]['documentId']);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) {
                                      return ChangeNotifierProvider.value(
                                        value: provider,
                                        child: SelfAssessment(),
                                      );
                                    }),
                                  );
                                },
                              );
                            }),
                      ),
                    ]),
                  )));
  }
}
