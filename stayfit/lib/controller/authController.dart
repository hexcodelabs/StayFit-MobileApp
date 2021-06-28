import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFunctions with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _firebaseUser;
  GoogleSignInAccount _user;
  String _signedInUserType;

  GoogleSignInAccount get user => _user;
  User get firebaseUser => _firebaseUser;
  String get signedInUserType => _signedInUserType;

  Future googleLogIn() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) {
      print("Error No user");
      return;
    }
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    var result = await _auth.signInWithCredential(credentials);
    notifyListeners();
    return result.user.uid; //this is only for debugginh purpose.
  }

  Future getUser() async {
    _firebaseUser = _auth.currentUser;
    notifyListeners();
  }

  Future isSignedInCheck() async {
    var user = _auth.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance
          .collection("trainee_users")
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          // print(doc.data());
          var traineeID = doc.id;
          if (traineeID == user.uid) {
            print("TRAINEE " + traineeID);
            _signedInUserType = "TRAINEE";
          }
        });
      });
      await FirebaseFirestore.instance
          .collection("gym_users")
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          // print(doc.data());
          var traineeID = doc.id;
          if (traineeID == user.uid) {
            print("GYM " + traineeID);
            _signedInUserType = "GYM";
          }
        });
      });
    } else {
      _signedInUserType = "NOUSER";
    }
    notifyListeners();
    return _signedInUserType;
  }

  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
