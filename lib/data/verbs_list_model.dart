import 'package:flutter/material.dart';
import 'package:irregularverbs/data/verbs_db.dart';

class VerbsListModel with ChangeNotifier {
  final VerbsDB db;

  VerbsListModel(this.db);

  List<Verb> _verbs = [];

  List<Verb> get verbs => _verbs;

  set verbs(List<Verb> verbs) {
    _verbs = verbs;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Future<void> loadVerbs() async {
    isLoading = true;
    verbs = await db.allVerbs;
    _currentVerbIndex = 0;
    isLoading = false;
  }

  int _currentVerbIndex = 0;

  void nextVerb() {
    _currentVerbIndex = (_currentVerbIndex + 1) % verbs.length;
    notifyListeners();
  }

  Verb get currentVerb => verbs[_currentVerbIndex];
}
