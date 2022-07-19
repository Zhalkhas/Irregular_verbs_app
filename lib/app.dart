import 'package:flutter/material.dart';
import 'package:irregularverbs/data/verbs_db.dart';
import 'package:irregularverbs/data/verbs_list_model.dart';
import 'package:irregularverbs/screen/home_page.dart';
import 'package:irregularverbs/widget/verbs_list_notifier.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final VerbsListModel model = VerbsListModel(VerbsDB())..loadVerbs();

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: VerbsListNotifier(
        model: model,
        child: const HomePage(),
      ),
    );
  }
}
