import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();
  final authLoading = false.obs;

  String get user => _firebaseUser.value?.email;

  void setAuthLoading(bool boolVal) {
    authLoading.update((_) {
      authLoading.value = boolVal;
    });
  }

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "Error creating account",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
        duration: Duration(seconds: 4),
      );
    }
  }

  Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar(
        "Signed in as,",
        email,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
        duration: Duration(seconds: 2),
      );
      return true;
    } catch (e) {
      Get.snackbar(
        "Error signing in",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
        duration: Duration(seconds: 4),
      );
      return false;
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar(
        "Error signing out",
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        margin: EdgeInsets.only(bottom: 12, left: 8, right: 8),
        duration: Duration(seconds: 4),
      );
    }
  }
}
