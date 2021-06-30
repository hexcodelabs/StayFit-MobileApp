import 'package:stayfit/model/GYM/instructor.dart';
import 'package:stayfit/model/GYM/session.dart';

class GYMUser {
  String id;
  String address;
  String admin;
  String gmail;
  int likes;
  String name;
  String phone_number;
  List<dynamic> sessions;
  List<Session> sessionDocs;
  String tag_line;
  List<dynamic> types;
  List<dynamic> instructors;
  List<Instructor> instructorDocs;

  GYMUser({
    this.id,
    this.address,
    this.admin,
    this.gmail,
    this.instructors,
    this.instructorDocs,
    this.likes,
    this.name,
    this.phone_number,
    this.sessions,
    this.sessionDocs,
    this.tag_line,
    this.types,
  });
}
