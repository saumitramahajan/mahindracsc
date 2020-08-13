import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  Future<String> getUid() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }

  Future<bool> login(String email, String password) async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(result.user.toString());
      if (result.user == null) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print('singin error::' + e.toString() + '\n\n');
      return false;
    }
  }

  Future<List<dynamic>> getRoles() async {
    String uid = await getUid();
    DocumentSnapshot value =
        await Firestore.instance.collection('users').document(uid).get();
    List<dynamic> role = value.data['role'];
    return role;
  }

  Future<void> sendLink(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
