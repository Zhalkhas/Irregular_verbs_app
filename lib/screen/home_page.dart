import 'package:flutter/material.dart';
import 'package:irregularverbs/widget/bottom_navbar.dart';
import 'package:irregularverbs/widget/verbs_list_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  int tries = 0;
  final infinitiveController = TextEditingController();
  final pastController = TextEditingController();
  final participleController = TextEditingController();
  final translationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    infinitiveController.dispose();
    pastController.dispose();
    participleController.dispose();
    translationController.dispose();
    super.dispose();
  }

  void _onClick(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Right! Go on!"),
      ));
      setState(() {
        pastController.text = "";
        participleController.text = "";
        tries = 0;
        index++;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Wrong! Try again!"),
      ));
      tries++;
    }
  }

  TextStyle _style() {
    return const TextStyle(
      color: Colors.black,
      fontStyle: FontStyle.normal,
      fontSize: 20,
    );
  }

  TextStyle _hintStyle() {
    return TextStyle(
      color: Colors.black.withOpacity(0.6),
      fontSize: 20,
      fontStyle: FontStyle.italic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = VerbsListNotifier.isVerbsListLoadingOf(context);
    if (isLoading) {
      return Scaffold(
          body: Center(
        child: Text(
          "Loading,,,",
          style: _style(),
        ),
      ));
    } else {
      return Scaffold(
          appBar: AppBar(title: const Text("Irregular verbs app")),
          bottomNavigationBar: const BottomNavbar(),
          body: Builder(builder: (context) {
            final verbs = VerbsListNotifier.verbsListOf(context);
            return Padding(
                padding: const EdgeInsets.all(30.0),
                child: Card(
                    child: Padding(
                        padding: const EdgeInsets.all(35.0),
                        child: Center(
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                          flex: 1,
                                          child: Text(
                                            "Infinitive:",
                                            style: _style(),
                                          )),
                                      Expanded(
                                          flex: 2,
                                          child: Center(
                                            child: Text(
                                              verbs[verbs.isNotEmpty
                                                      ? index % verbs.length
                                                      : 0]
                                                  .infinitive,
                                              style: _style(),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Past:",
                                          style: _style(),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: TextFormField(
                                          validator: (input) {
                                            final verb =
                                                verbs[index % verbs.length];
                                            return verb.past ==
                                                    input?.toLowerCase()
                                                ? null
                                                : '';
                                          },
                                          decoration: InputDecoration(
                                              border:
                                                  const OutlineInputBorder(),
                                              hintStyle: _hintStyle(),
                                              hintText: 'Past'),
                                          controller: pastController,
                                          style: _style(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          "Participle:",
                                          style: _style(),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: TextFormField(
                                          validator: (input) {
                                            final verb =
                                                verbs[index % verbs.length];
                                            return verb.participle ==
                                                    input?.toLowerCase()
                                                ? null
                                                : '';
                                          },
                                          decoration: InputDecoration(
                                              border:
                                                  const OutlineInputBorder(),
                                              hintStyle: _hintStyle(),
                                              hintText: 'Participle'),
                                          controller: participleController,
                                          style: _style(),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Ink(
                                    decoration: const ShapeDecoration(
                                      color: Colors.lightBlue,
                                      shape: CircleBorder(),
                                    ),
                                    child: IconButton(
                                      icon: const Icon(Icons.navigate_next),
                                      tooltip: 'Submit',
                                      iconSize: 80,
                                      onPressed: () => _onClick(context),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ))));
          }));
    }
  }
}
