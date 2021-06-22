import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController{
  FirebaseAuth _auth = FirebaseAuth.instance;
}


class AuthFunctions with ChangeNotifier{

  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  User _firebaseUser;
  GoogleSignInAccount _user;

  GoogleSignInAccount get user => _user;
  User get firebaseUser => _firebaseUser;

  Future googleLogIn() async{
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if(googleUser==null) return;
    _user = googleUser;

    final googleAuth = await googleUser.authentication;

    final credentials = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    var result = await _auth.signInWithCredential(credentials);
    notifyListeners();
    return result.user.uid;//this is only for debugginh purpose.
  }

  Future getUser() async {
    _firebaseUser = _auth.currentUser;
    notifyListeners();
  }

 
}
