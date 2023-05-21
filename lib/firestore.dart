import 'package:cloud_firestore/cloud_firestore.dart';

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
}
