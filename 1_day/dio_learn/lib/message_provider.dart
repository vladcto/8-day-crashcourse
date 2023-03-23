import 'package:flutter/material.dart';

class MessageProvider extends ChangeNotifier {
  String message = "It's empty dude!";

  void change(String message) {
    this.message = message;
    notifyListeners();
  }
}
