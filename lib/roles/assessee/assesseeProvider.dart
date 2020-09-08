import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:mahindraCSC/z_repository/userRepository.dart';

class AssesseeProvider extends ChangeNotifier {
  final UserRepository userRepository = UserRepository();

  Future<String> getLocationName() async {
    String cycleId = '';
    String uid = '';
    await FirebaseAuth.instance.currentUser().then((value) => uid = value.uid);
    await Firestore.instance
        .collection('cycles')
        .where('assesseeUid', isEqualTo: uid)
        .getDocuments()
        .then((value) => cycleId = value.documents[0].documentID);
    return cycleId;
  }
}
