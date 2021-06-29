class Session {
  List<String> attendees;
  DateTime end_timestamp;
  List<String> followers;
  String gym;
  String langusge;
  String name;
  String price;
  DateTime start_timestamp;
  String type;
  String instructor;

  Session({
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
