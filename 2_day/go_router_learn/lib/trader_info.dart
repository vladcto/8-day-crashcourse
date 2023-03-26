import 'package:flutter/material.dart';

class TraderInfo extends ChangeNotifier {
  String _name = "", _tradingCompany = "";

  String get name => _name;
  String get tradingCompany => _tradingCompany;

  void updateWith({String name = "", String tradingCompany = ""}) {
    if (name.isNotEmpty) _name = name;
    if (tradingCompany.isNotEmpty) _tradingCompany = tradingCompany;
    notifyListeners();
  }

  String toRichString() {
    return "Продавец $_name,\n Компания $_tradingCompany.";
  }

  @override
  String toString() => "$_name, $_tradingCompany.";
}
