import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreService {
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  void savePinCode(String pinCode) {
    if (_auth.currentUser != null) {
      _fireStore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({'pinCode': pinCode});
    }
  }

  Future<String> getPinCode() async {
    String pin = '';
    if (_auth.currentUser != null) {
      final document =
          await _fireStore.collection('users').doc(_auth.currentUser!.uid).get();

      if (document.data() != null && document.data()!.containsKey('pinCode')) {
        pin = document['pinCode'];
      }
    }
    return pin;
  }
}
