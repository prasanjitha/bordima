import 'package:flutter/cupertino.dart';

class MyData extends ChangeNotifier {
  String _name = 'Kamal';

  void changeName(String name) {
    _name = name;
    notifyListeners();
  }

  String get name => _name;
}
