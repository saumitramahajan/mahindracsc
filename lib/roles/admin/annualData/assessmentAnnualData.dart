import 'package:flutter/material.dart';
import 'package:mahindraCSC/roles/admin/annualData/annualDataProvider.dart';
import 'package:provider/provider.dart';

class AssessmentAnnualData extends StatefulWidget {
  @override
  _AssessmentAnnualDataState createState() => _AssessmentAnnualDataState();
}

class _AssessmentAnnualDataState extends State<AssessmentAnnualData> {
  @override
  Widget build(BuildContext context) {
    final adprovider = Provider.of<AnnualDataProvider>(context);
    List<bool> opens = List.generate(
        adprovider.assessmentAnnualDataList.length, (index) => false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Assessment Annual Data'),
      ),
      body: adprovider.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: ListView.builder(
                itemCount: adprovider.assessmentAnnualDataList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (opens[index]) {
                          opens[index] = false;
                        } else {
                          opens[index] = true;
                        }
                        print(opens.toString() + index.toString());
                      });
                    },
                    child: Card(
                        child: ExpansionTile(
                      title: Text('Location: ' +
                          adprovider.assessmentAnnualDataList[index]
                              ['location']),
                      children: [
                        Text('Location: ' +
                            adprovider.assessmentAnnualDataList[index]
                                ['location'] +
                            '1'),
                        Text('Location: ' +
                            adprovider.assessmentAnnualDataList[index]
                                ['location'] +
                            '2'),
                      ],
                    )),
                  );
                },
              ),
            ),
    );
  }

  Widget category1View(Map<String, String> map) {
    return Column(
      children: [
        Text('Manpower: ' + map['location']),
      ],
    );
  }
}
