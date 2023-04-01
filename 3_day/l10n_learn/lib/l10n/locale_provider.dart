import 'package:flutter/material.dart';
import 'package:l10n_learn/l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale locale = L10n.supported[0];

  void set(Locale locale) {
    this.locale = locale;
    notifyListeners();
  }
}
