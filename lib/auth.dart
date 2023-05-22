import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late UserCredential userCredential;
  User? get currentUser => _firebaseAuth.currentUser;
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    userCredential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }

  Future<void> updateUsernamePassword(
      String newEmail, String newPassword) async {
    await _firebaseAuth.currentUser!.updateEmail(newEmail);
    await _firebaseAuth.currentUser!.updatePassword(newPassword);
  }
}
