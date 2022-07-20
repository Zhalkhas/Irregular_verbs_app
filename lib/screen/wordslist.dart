import 'package:flutter/material.dart';
import 'package:irregularverbs/widget/verbs_list_notifier.dart';
import 'package:irregularverbs/widget/bottom_navbar.dart';

class Wordlist extends StatelessWidget {
  const Wordlist({Key? key}) : super(key: key);

  TextStyle get _style => const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 20,
      );

  @override
  Widget build(BuildContext context) {
    final verbs = VerbsListNotifier.verbsListOf(context);
    return Scaffold(
      bottomNavigationBar: const BottomNavbar(),
      appBar: AppBar(title: const Text("Irregular verbs app")),
      body: Column(
        children: [
          Material(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Center(
                    child: Text(
                      "Infinitive",
                      style: _style,
                    ),
                  ),
                  Center(
                      child: Text(
                    "Past",
                    style: _style,
                  )),
                  Center(
                      child: Text(
                    "Participle",
                    style: _style,
                  )),
                  Center(
                      child: Text(
                    "Translation",
                    style: _style,
                  )),
                ].map((e) => Expanded(child: e)).toList(),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: verbs.length,
              itemBuilder: (context, index) {
                final verb = verbs[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Row(
                    children: [
                      verb.infinitive,
                      verb.past,
                      verb.participle,
                      verb.translation
                    ]
                        .map((e) => Expanded(
                                child: Center(
                                    child: Text(
                              e,
                              textAlign: TextAlign.center,
                            ))))
                        .toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
