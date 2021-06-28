import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Database with ChangeNotifier {
  bool _traineeCreateStatus = true;
  bool _gymCreateStatus = true;
  bool _sessionCreateStatus = true;
  bool _gymListFetchStatus = false;
  bool _gymSessionFetchStatus = false;
  bool _gymUsersFetchStatus = false;
  bool _favouritesFetchStatus = false;

  Map<int, dynamic> _gymList = {};
  List<Map> _gymSessions = [];
  List<Map> _favourites = [];

  bool get traineeCreateStatus => _traineeCreateStatus;
  bool get gymCreateStatus => _gymCreateStatus;
  bool get sessionCreateStatus => _sessionCreateStatus;
  bool get getGymListFetchStatus => _gymListFetchStatus;
  bool get getGymSessionFetchStatus => _gymSessionFetchStatus;
  bool get getGymUsersFetchStatus => _gymUsersFetchStatus;
  bool get getFavouritesFetchStatus => _favouritesFetchStatus;

  Map<int, dynamic> get getGymList => _gymList;
  List<Map> get getGymSessions => _gymSessions;
  List<Map> get getFavourites=> _favourites;

  set setGymListFetchStatus(bool value) {
    _gymListFetchStatus = value;
    notifyListeners();
  }

  set setGymSessionFetchStatus(bool value) {
    _gymSessionFetchStatus = value;
    notifyListeners();
  }

  Future<void> createTrainee(uid, object) async {
    await FirebaseFirestore.instance
        .collection("trainee_users")
        .doc(uid)
        .set(object)
        .catchError((e) {
      _traineeCreateStatus = false;
      print(e.toString());
    });
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
    });
    notifyListeners();
  }

  Future<void> createSession(object) async {
    DocumentReference ref =
    FirebaseFirestore.instance.collection("gym_sessions").doc();
    await ref.set(object).catchError((e) {
      _sessionCreateStatus = false;
      print(e.toString());
    });
    notifyListeners();
  }

  Future<void> getGymUsers() async {
    _gymUsersFetchStatus = false;
    int index = 0;
    _gymList = {};
    await FirebaseFirestore.instance
        .collection('gym_users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        _gymList[index] = doc.data();
        index++;
      });
    });
    _gymUsersFetchStatus = true;
    notifyListeners();
  }

  Future<void> getSessionForGym(int entry) async {
    _gymSessionFetchStatus = false;
    _gymSessions = [];
    Map session = {};
    for (int i = 0; i < _gymList[entry]["sessions"].length; i++) {
      await FirebaseFirestore.instance
          .doc(_gymList[entry]["sessions"][i])
          .get()
          .then((doc) => {
                session = doc.data(),
                session["id"] = _gymList[entry]["sessions"][i],
                _gymSessions.add(session)
              });
    }
    _gymSessionFetchStatus = true;
    notifyListeners();
  }

  Future<void> setFavorites(String uId, String sessionId) async {
    await FirebaseFirestore.instance
        .collection("trainee_users")
        .doc(uId)
        .update({
      "favourites": FieldValue.arrayUnion([sessionId])
    });

  }

  Future<void> removeFavorites(String uId, String sessionId) async {
    await FirebaseFirestore.instance
        .collection("trainee_users")
        .doc(uId)
        .update({
      "favourites": FieldValue.arrayRemove([sessionId])
    });
  }

  Future<void> favourites(List<dynamic> sessionIds) async {

    if (sessionIds != null){
      if(sessionIds.isEmpty){
        _favourites = [];
      }else{
        _favouritesFetchStatus = false;
        _favourites = [];

        for (int i=0 ; i<sessionIds.length ; i++){
          await FirebaseFirestore.instance
              .doc(sessionIds[i])
              .get()
              .then((doc) => {
            _favourites.add(doc.data())
          });
        }
        print(_favourites);
        _favouritesFetchStatus = true;
        notifyListeners();
      }

    }



  }

}


//  DocumentSnapshot docSnap = await _gymList[entry]["sessions"][0].get();
//  _gymSessions.add(Map<String, dynamic>.from(docSnap.data()));
//  var data = await _gymList[entry]["sessions"].forEach((session) async {
//    DocumentSnapshot data = await session.get();
//    _gymSessions.add(Map<String, dynamic>.from(data.data()));
//    print(data.data());
//    index++;
//  });