import 'package:flutter/cupertino.dart';
import 'package:irregularverbs/data/verbs_db.dart';
import 'package:irregularverbs/data/verbs_list_model.dart';

class VerbsListNotifier extends InheritedNotifier<VerbsListModel> {
  const VerbsListNotifier({
    Key? key,
    required Widget child,
    required VerbsListModel model,
  }) : super(key: key, child: child, notifier: model);

  static List<Verb> verbsListOf(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<VerbsListNotifier>()
          ?.notifier
          ?.verbs ??
      [];

  static bool isVerbsListLoadingOf(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<VerbsListNotifier>()
          ?.notifier
          ?.isLoading ??
      false;

  static void loadVerbsListOf(BuildContext context) {
    final inhW = context
        .getElementForInheritedWidgetOfExactType<VerbsListNotifier>()
        ?.widget;
    if (inhW is VerbsListNotifier) {
      inhW.notifier?.loadVerbs();
    }
  }

  static void loadNextVerbOf(BuildContext context) {
    final inhW = context
        .getElementForInheritedWidgetOfExactType<VerbsListNotifier>()
        ?.widget;
    if (inhW is VerbsListNotifier) {
      inhW.notifier?.nextVerb();
    }
  }

  static Verb currentVerbOf(BuildContext context) => (context
      .dependOnInheritedWidgetOfExactType<VerbsListNotifier>()
      ?.notifier
      ?.currentVerb)!;
}
