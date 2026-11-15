import 'package:five_by_five/main_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FiveByFiveApp());
}

class FiveByFiveApp extends StatelessWidget {
  const FiveByFiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Five by five',
      home: MainScreen(title: 'Five by five'),
    );
  }
}

class MultiplicatorModel extends ChangeNotifier {
  List<int> modelElementsList = [];

  void getModelElement(int multiplicatorOfSwich) {
    modelElementsList.add(multiplicatorOfSwich);
    notifyListeners();
  }

  void removeModelElemtnt(int multiplicatorOfSwich) {
    modelElementsList.remove(multiplicatorOfSwich);
    notifyListeners();
  }

  void clearModelElements() {
    modelElementsList.clear();
  }
}
