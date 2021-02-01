import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'database_service.dart';

class AuthService {
  AuthService(this._firebaseAuth);

  final FirebaseAuth _firebaseAuth;

  Stream<User> get idTokenChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn(
      {@required String email, @required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed in';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp(
      {@required String email,
      @required String password,
      @required String pseudo}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      await userCredential.user.updateProfile(displayName: pseudo);
      await signIn(email: email, password: password);

      final _databaseService = DatabaseService();

      //await _databaseService.firebaseFirestore
      //    .collection('Users')
      //    .doc(userCredential.user.uid)
      //    .set({
      //  'blabla': [],,
      //});

      return 'Signed up';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}
