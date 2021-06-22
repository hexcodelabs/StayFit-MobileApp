import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Database with ChangeNotifier {
  bool _traineeCreateStatus = true;
  bool _gymCreateStatus = true;
  Map<String,String> _gymDetails,_traineeDetails;

  bool get traineeCreateStatus => _traineeCreateStatus;
  bool get gymCreateStatus => _gymCreateStatus;
  Map<String,String> get gymDetails => _gymDetails;
  Map<String,String> get traineeDetails => _traineeDetails;

  Future<void> createTrainee(uid, object) async {
    _traineeDetails = object;
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
    _gymDetails = object;
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
