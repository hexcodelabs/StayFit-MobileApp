import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stayfit/model/GYM/instructor.dart';
import 'package:stayfit/model/GYM/session.dart';
import 'package:stayfit/model/GYM/user.dart';

class Database with ChangeNotifier {
  bool _traineeCreateStatus = true;
  bool _gymCreateStatus = true;
  bool _sessionCreateStatus = true;
  bool _sessionUpdateStatus = true;
  bool _instructorCreateStatus = true;
  bool _gymListFetchStatus = false;
  bool _gymSessionFetchStatus = false;
  bool _gymUsersFetchStatus = false;
  bool _favouritesFetchStatus = false;

  GYMUser _gymUser = new GYMUser();
  Map<int, dynamic> _gymList = {};
  List<Map> _gymSessions = [];
  List<Map> _favourites = [];

  bool get traineeCreateStatus => _traineeCreateStatus;
  bool get gymCreateStatus => _gymCreateStatus;
  bool get sessionCreateStatus => _sessionCreateStatus;
  bool get sessionUpdateStatus => _sessionUpdateStatus;
  bool get instructorCreateStatus => _instructorCreateStatus;
  GYMUser get gymUser => _gymUser;
  bool get getGymListFetchStatus => _gymListFetchStatus;
  bool get getGymSessionFetchStatus => _gymSessionFetchStatus;
  bool get getGymUsersFetchStatus => _gymUsersFetchStatus;
  bool get getFavouritesFetchStatus => _favouritesFetchStatus;

  Map<int, dynamic> get getGymList => _gymList;
  List<Map> get getGymSessions => _gymSessions;
  List<Map> get getFavourites => _favourites;

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
        .then((value) => () async {
              debugPrint("asd");
            })
        .catchError((e) {
      _gymCreateStatus = false;
      print(e.toString());
    });
    await loadUserData(uid);
    notifyListeners();
  }

  Future<void> loadUserData(uid) async {
    debugPrint("load datsa");
    DocumentSnapshot docSnap =
        await FirebaseFirestore.instance.collection("gym_users").doc(uid).get();
    Map<String, dynamic> lis = docSnap.data();

    _gymUser = GYMUser(
      address: lis["address"],
      admin: lis["admin"],
      gmail: lis["gmail"],
      id: uid,
      instructorDocs: [],
      instructors: lis["instructors"],
      likes: lis["likes"],
      name: lis["name"],
      phone_number: lis["phone_number"],
      sessionDocs: [],
      sessions: lis["sessions"],
      tag_line: lis["tag_line"],
      types: lis["types"],
    );

    if (_gymUser.instructors.length > 0) {
      for (var instructor in _gymUser.instructors) {
        Map data = {};
        var i = new Instructor();
        await FirebaseFirestore.instance.doc(instructor).get().then((doc) => {
              data = doc.data(),
              debugPrint(instructor.toString().split("/")[1]),
              i = new Instructor(
                gym: data["gym"],
                id: doc.id,
                image: data["image"],
                name: data["name"],
                sessions: data["sessions"],
              ),
              _gymUser.instructorDocs.add(i),
            });
      }
    }

    if (_gymUser.sessions.length > 0) {
      for (var session in _gymUser.sessions) {
        Map data = {};
        var i = new Session();
        await FirebaseFirestore.instance.doc(session).get().then((doc) => {
              data = doc.data(),
              i = new Session(
                attendees: data["attendees"],
                end_timestamp: DateTime.fromMicrosecondsSinceEpoch(
                    data["end_timestamp"].microsecondsSinceEpoch),
                followers: data["followers"],
                gym: data["gym"],
                id: doc.id,
                instructor: data["instructor"],
                langusge: data["language"],
                name: data["name"],
                price: data["price"],
                start_timestamp: DateTime.fromMicrosecondsSinceEpoch(
                    data["start_timestamp"].microsecondsSinceEpoch),
                image: data["image"],
                type: data["type"],
              ),
              debugPrint(i.start_timestamp.toString()),
              debugPrint(i.end_timestamp.toString()),
              _gymUser.sessionDocs.add(i),
            });
      }
    }

    notifyListeners();
  }

  Future<void> createSession(object, instructorIndex) async {
    _sessionCreateStatus = true;
    DocumentReference ref =
        FirebaseFirestore.instance.collection("gym_sessions").doc();
    await ref.set(object).catchError((e) {
      _sessionCreateStatus = false;
    });

    DocumentReference ref2 = FirebaseFirestore.instance
        .collection(object["gym"].toString().split("/")[0])
        .doc(object["gym"].toString().split("/")[1]);
    _gymUser.sessions.add("gym_sessions/" + ref.id);

    await ref2.update({
      "sessions": List<String>.from(_gymUser.sessions),
    }).catchError((e) {
      debugPrint("DSgdf");
      _sessionCreateStatus = false;
    });

    var i = new Session();
    i = new Session(
      attendees: object["attendees"],
      end_timestamp: object["end_timestamp"],
      followers: object["followers"],
      gym: object["gym"],
      id: ref.id,
      instructor: object["instructor"],
      langusge: object["language"],
      name: object["name"],
      price: object["price"],
      start_timestamp: object["start_timestamp"],
      image: object["image"],
      type: object["type"],
    );
    _gymUser.sessionDocs.add(i);

    DocumentReference ref3 = FirebaseFirestore.instance
        .collection(object["instructor"].toString().split("/")[0])
        .doc(object["instructor"].toString().split("/")[1]);

    _gymUser.instructorDocs[instructorIndex].sessions
        .add("gym_sessions/" + ref.id);

    await ref3.update({
      "sessions":
          List<String>.from(_gymUser.instructorDocs[instructorIndex].sessions),
    }).catchError((e) {
      debugPrint("DSgdf");
      _sessionCreateStatus = false;
    });

    notifyListeners();
  }

  Future<void> updateSession(
      object, instructorIndex, sessionID, preInstructor) async {
    _sessionUpdateStatus = true;
    DocumentReference ref =
        FirebaseFirestore.instance.collection("gym_sessions").doc(sessionID);
    await ref.update(object).catchError((e) {
      debugPrint("1");
      _sessionUpdateStatus = false;
    });

    int sessionDocIndex =
        _gymUser.sessionDocs.indexWhere((element) => sessionID == element.id);

    _gymUser.sessionDocs[sessionDocIndex].end_timestamp =
        object["end_timestamp"];

    _gymUser.sessionDocs[sessionDocIndex].langusge = object["langusge"];
    _gymUser.sessionDocs[sessionDocIndex].name = object["name"];
    _gymUser.sessionDocs[sessionDocIndex].price = object["price"];
    _gymUser.sessionDocs[sessionDocIndex].start_timestamp =
        object["start_timestamp"];
    _gymUser.sessionDocs[sessionDocIndex].image = object["image"];

    if (preInstructor != object["instructor"]) {
      _gymUser.sessionDocs[sessionDocIndex].instructor = object["instructor"];

      DocumentReference ref3 = FirebaseFirestore.instance
          .collection(object["instructor"].toString().split("/")[0])
          .doc(object["instructor"].toString().split("/")[1]);

      _gymUser.instructorDocs[instructorIndex].sessions
          .add("gym_sessions/" + ref.id);

      await ref3.update({
        "sessions": List<String>.from(
            _gymUser.instructorDocs[instructorIndex].sessions),
      }).catchError((e) {
        _sessionUpdateStatus = false;
      });

      int preInstructorDocIndex = _gymUser.instructorDocs
          .indexWhere((element) => preInstructor.split("/")[1] == element.id);

      DocumentReference ref4 = FirebaseFirestore.instance
          .collection("gym_instructors")
          .doc(_gymUser.instructorDocs[preInstructorDocIndex].id);

      _gymUser.instructorDocs[preInstructorDocIndex].sessions
          .remove("gym_sessions/" + ref.id);

      await ref4.update({
        "sessions": List<String>.from(
            _gymUser.instructorDocs[preInstructorDocIndex].sessions),
      }).catchError((e) {
        _sessionUpdateStatus = false;
      });
    }

    notifyListeners();
  }

  Future<void> createInstructor(object) async {
    _instructorCreateStatus = true;
    DocumentReference ref =
        FirebaseFirestore.instance.collection("gym_instructors").doc();
    await ref.set(object).catchError((e) {
      _instructorCreateStatus = false;
      print(e.toString());
    });

    DocumentReference ref2 = FirebaseFirestore.instance
        .collection(object["gym"].toString().split("/")[0])
        .doc(object["gym"].toString().split("/")[1]);
    _gymUser.instructors.add("gym_instructors/" + ref.id);

    await ref2.update({
      "instructors": List<String>.from(_gymUser.instructors),
    }).catchError((e) {
      _instructorCreateStatus = false;
    });

    var i = new Instructor();

    i = new Instructor(
      gym: object["gym"],
      id: ref.id,
      image: object["image"],
      name: object["name"],
      sessions: object["sessions"],
    );
    _gymUser.instructorDocs.add(i);

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
    if (sessionIds != null) {
      if (sessionIds.isEmpty) {
        _favourites = [];
      } else {
        _favouritesFetchStatus = false;
        _favourites = [];

        for (int i = 0; i < sessionIds.length; i++) {
          await FirebaseFirestore.instance
              .doc(sessionIds[i])
              .get()
              .then((doc) => {_favourites.add(doc.data())});
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
