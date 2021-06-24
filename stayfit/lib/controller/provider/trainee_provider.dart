import 'package:flutter/foundation.dart';

class TraineeProvider with ChangeNotifier {

  String _name = "Tharaka";
  String _address = "Bandaragama";

  String get getName => _name;
  String get getAddress => _address;

  set setName(String text) {
    _name = text;
    notifyListeners();
  }

  set setAddress(String text) {
    _address = text;
    notifyListeners();
  }

  Future<void> getUserDetails() async{

  }

}