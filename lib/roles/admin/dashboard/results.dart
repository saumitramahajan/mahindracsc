import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  int total = 0;
  int self = 0;
  int site = 0;
  int closed = 0;
  String currentStatus;
  bool loading = true;

  Future<void> getAssessmentNumbers() async {
    final QuerySnapshot qSnap =
        await Firestore.instance.collection('cycles').getDocuments();
    total = qSnap.documents.length;
    print(qSnap.toString());
    for (int i = 0; i < total; i++) {
      currentStatus = qSnap.documents[i].data['currentStatus'];

      switch (currentStatus) {
        case 'Self Assessment Uploaded':
          {
            self++;
          }
          break;
        case 'Site Assessment Uploaded':
          {
            site++;
          }
          break;
        case 'Closed':
          {
            closed++;
          }
          break;
      }
    }
    setState(() {
      loading= false;
    });
    print('total' + total.toString());
  }

  @override
  void initState() {
    getAssessmentNumbers();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:loading?Center(child:CircularProgressIndicator()): CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
              child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: Carousel(
                boxFit: BoxFit.fitWidth,
                images: [
                  AssetImage('assets/Picture1.png'),
                  AssetImage('assets/Picture2.png'),
                  AssetImage('assets/Picture3.png'),
                ],
                autoplay: true,
                indicatorBgPadding: 0,
                dotBgColor: Colors.transparent),
          )),
          SliverGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 1.0,
              children: [
                Container(
                  color: Colors.green[50],
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: Column(
                    children: [
                      Text('Scheduled Assessment: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(total.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 70))
                    ],
                  ),
                ),
                Container(
                  color: Colors.green[100],
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  child: Column(
                    children: [
                      Text('Self Assessment Uploaded: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(self.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 70))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  color: Colors.green[200],
                  child: Column(
                    children: [
                      Text('Site Assessment Uploaded: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(site.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 70))
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                  color: Colors.green[300],
                  child: Column(
                    children: [
                      Text('Closed: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      SizedBox(height: 20),
                      Text(closed.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 70))
                    ],
                  ),
                )
              ])
        ],
      ),
    );
  }
}
