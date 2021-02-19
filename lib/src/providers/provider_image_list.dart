import 'package:flutter/cupertino.dart';

class ProviderImageList extends ChangeNotifier {
  List<String> imageList = <String>[];

  void addImage(String i) {
    imageList.add(i);
    notifyListeners();
  }

  void delImage(String i) {
    imageList.remove(i);
    notifyListeners();
  }
}
