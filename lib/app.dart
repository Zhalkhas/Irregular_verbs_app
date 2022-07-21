import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:irregularverbs/data/verbs_db.dart';
import 'package:irregularverbs/data/verbs_list_model.dart';
import 'package:irregularverbs/screen/home/home_page.dart';
import 'package:irregularverbs/screen/wordslist.dart';
import 'package:irregularverbs/widget/verbs_list_notifier.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final VerbsListModel model = VerbsListModel(VerbsDB())..loadVerbs();
  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
      ),
      GoRoute(
        path: '/wordslist',
        builder: (BuildContext context, GoRouterState state) =>
            const Wordlist(),
      ),
    ],
  );

  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VerbsListNotifier(
      model: model,
      child: MaterialApp.router(
        title: 'Irregular verbs',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerDelegate: _router.routerDelegate,
        routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      ),
    );
  }
}
