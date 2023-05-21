import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:upj_digital_canteen/auth.dart';

class UserData {
  final firebaseInstance = FirebaseFirestore.instance;
  void addUserToCollection({
    required String uid,
    required String username,
  }) {
    firebaseInstance.collection('users').doc(uid).set({
      'name': username,
    });
  }
}

class MerchantData {
  final firebaseInstance = FirebaseFirestore.instance;
  void addMerchantToCollection({
    required String uid,
    required String username,
  }) {
    firebaseInstance.collection('merchants').doc(uid).set(
      {'name': username},
    );
  }

  CollectionReference getFoodData() {
    return firebaseInstance
        .collection('merchants')
        .doc(Auth().currentUser!.uid)
        .collection('foods');
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getFoodCollectionSnapshot() {
    return firebaseInstance
        .collection('merchants')
        .doc(Auth().currentUser!.uid)
        .collection('foods')
        .snapshots();
  }
}
