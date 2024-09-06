import 'package:flutter/foundation.dart';

class BottomNavProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  set updateIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
