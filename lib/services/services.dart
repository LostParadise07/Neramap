// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';
import 'package:neuramap/services/database.dart';
// import 'package:neuramap/services/database.dart';
import '../models/user.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TheUser? _userFromFirebaseUser(User? user) {
    return user != null ? TheUser(uid: user.uid) : null;
  }

  Stream<TheUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthException
      print('Error during sign in: ${e.code}');
      return null; // or throw exception
    }
  }

  // Rest of your methods...
  Future<UserCredential?> signup(String email, String password, String name,
      String gender, String birthdate) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;
      // create a new document for the user with the uid
      await DataBaseServices(uid: user!.uid)
          .updateUserData(name, gender, birthdate);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthException
      print('Error during sign up: ${e.code}');
      return null; // or throw exception
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error during sign out: $e');
    }
  }

  // Future<void> addQuestion(
  //   String collectionName,
  //   String userUid, // Pass the user's UID as an argument
  //   int questionNumber,
  //   int optionSelected,
  // ) async {
  //   try {
  //     final CollectionReference questionCollection =
  //         FirebaseFirestore.instance.collection(collectionName);

  //     await questionCollection.doc(userUid).collection('questions').add({
  //       'questionNumber': questionNumber,
  //       'optionSelected': optionSelected,
  //     });

  //     print('Question data added successfully');
  //   } catch (e) {
  //     print('Error adding question data: $e');
  //   }
  // }

  Stream<TheUser?> get authStateChanges {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }
}
