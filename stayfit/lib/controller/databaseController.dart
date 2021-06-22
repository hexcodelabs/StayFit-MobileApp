import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Database with ChangeNotifier {
  bool _traineeCreateStatus = true;
  bool _gymCreateStatus = true;


  bool get traineeCreateStatus => _traineeCreateStatus;
  bool get gymCreateStatus => _gymCreateStatus;


  Future<void> createTrainee(uid, object) async {

    await FirebaseFirestore.instance
        .collection("trainee_users")
        .doc(uid)
        .set(object)
        .catchError((e) {
          _traineeCreateStatus = false;
          print(e.toString());
        }
      );
    notifyListeners();
  }

  Future<void> createGYM(uid, object) async {

    await FirebaseFirestore.instance
        .collection("gym_users")
        .doc(uid)
        .set(object)
        .catchError((e) {
          _gymCreateStatus = false;
          print(e.toString());
        }
      );
    notifyListeners();
  }
}
