import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AssessorLocationListInfoRepository {
  Future<String> getUid() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  Future<List<Map<String, String>>> getAssessorLocationInfo() async {
    String uid = await getUid();
    List<Map<String, String>> locationList = [];

    QuerySnapshot cycles = await Firestore.instance
        .collection('cycles')
        .where('currentStatus', isEqualTo: 'Self Assessment Uploaded')
        .where('assessorUid', isEqualTo: uid)
        .getDocuments();
    for (int i = 0; i < cycles.documents.length; i++) {
      Map<String, String> locationMap = {
        'location': cycles.documents[i].data['location'],
        'name': cycles.documents[i].data['name'],
        'locationId': cycles.documents[i].documentID
      };
      locationList.add(locationMap);
    }

    return locationList;
  }
}
