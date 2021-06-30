class Session {
  String id;
  List<dynamic> attendees;
  DateTime end_timestamp;
  List<dynamic> followers;
  String gym;
  String langusge;
  String name;
  String price;
  DateTime start_timestamp;
  String type;
  String instructor;
  String image;

  Session({
    this.id,
    this.image,
    this.attendees,
    this.end_timestamp,
    this.followers,
    this.gym,
    this.instructor,
    this.langusge,
    this.name,
    this.price,
    this.start_timestamp,
    this.type,
  });
}
