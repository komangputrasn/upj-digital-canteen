import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  final firebaseInstance = FirebaseFirestore.instance;
  void addUserToCollection({
    required String uid,
    required String username,
    required String role,
  }) {
    firebaseInstance.collection('users').doc(uid).set(
      {
        'name': username,
        'role': role,
      },
    );
  }
}
