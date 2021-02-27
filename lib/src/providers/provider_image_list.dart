import 'package:flutter/cupertino.dart';

class ProviderImageList extends ChangeNotifier {
  List<String> imageList = <String>[];
  List<String> docList = <String>[];

  void addImage(String i) {
    imageList.add(i);
    notifyListeners();
  }

  void delImage(String i) {
    imageList.remove(i);
    notifyListeners();
  }

  void addDoc(String i) {
    docList.add(i);
    notifyListeners();
  }

  void delDoc(String i) {
    docList.remove(i);
    notifyListeners();
  }
}
