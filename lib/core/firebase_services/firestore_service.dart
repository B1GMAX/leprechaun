import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FireStoreService {
  final fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  void savePinCode(String pinCode) {
    if (_auth.currentUser != null) {
      fireStore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .set({'pinCode': pinCode});
    }
  }


}
