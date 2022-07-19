import 'package:flutter/material.dart';
import 'package:irregularverbs/data/db_helper.dart';
import 'package:irregularverbs/ui/wordslist.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = DatabaseHelper.instance;
  List<Verb> list;
  var index = 0;
  var tries = 0;
  final infinitiveController = TextEditingController();
  final pastController = TextEditingController();
  final participleController = TextEditingController();
  final translationController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    infinitiveController.dispose();
    pastController.dispose();
    participleController.dispose();
    translationController.dispose();
    super.dispose();
  }

  _HomePageState() {
    _init();
  }

  void _onClick(BuildContext context) async {
    var verb = list[index];
    if (pastController.text.toLowerCase() == verb.past &&
        participleController.text.toLowerCase() == verb.participle) {
      Scaffold.of(context).showSnackBar(const SnackBar(
        content: Text("Right! Go on!"),
      ));
      setState(() {
        pastController.text = "";
        participleController.text = "";
        tries = 0;
        (index < list.length) ? index++ : index = 0;
      });
    } else {
      Scaffold.of(context).showSnackBar(const SnackBar(
        content: Text("Wrong! Try again!"),
      ));
      tries++;
    }
  }

  void _init() async {
    print("started db aquire");
    this.list = await DatabaseHelper.instance.queryAllRows();
    this.list.shuffle();
    print("finished db aquire");
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
    return FutureBuilder<List<Verb>>(
      future: DatabaseHelper.instance.queryAllRows(),
      builder: (BuildContext ctx, AsyncSnapshot<List<Verb>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              body: Center(
            child: Text(
              "Loading,,,",
              style: _style(),
            ),
          ));
        } else {
          return Scaffold(
              drawer: Drawer(
                child: ListView(
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        leading: const FlutterLogo(),
                        title: Text(
                          'Irregular verbs',
                          style: _style(),
                        ),
                        subtitle: const Text('Main menu'),
                      ),
                    ),
                    Card(
                        child: ListTile(
                      leading: const Icon(Icons.font_download),
                      title: Text(
                        'Guess words',
                        style: _style(),
                      ),
                      subtitle: const Text("Start guessing irregular verbs"),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    )),
                    Card(
                        child: ListTile(
                      leading: const Icon(Icons.reorder),
                      title: Text(
                        'Wordlist',
                        style: _style(),
                      ),
                      subtitle: const Text("List of irregular verbs"),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Wordlist(
                                      list: list,
                                    )));
                      },
                    ))
                  ],
                ),
              ),
              appBar: AppBar(title: const Text("Irregular verbs app")),
              body: Builder(
                  builder: (context) => Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Card(
                          child: Padding(
                              padding: const EdgeInsets.all(35.0),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
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
                                                  list[index].infinitive,
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
                                            child: TextField(
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
                                            child: TextField(
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
                              ))))));
        }
      },
    );
  }
}
