import 'package:flutter/material.dart';
import 'package:irregularverbs/data/verbs_db.dart';
import 'package:irregularverbs/screen/home_page.dart';
import 'package:irregularverbs/widget/verbs_list_notifier.dart';

class Wordlist extends StatelessWidget {
  const Wordlist({Key? key}) : super(key: key);

  TextStyle get _style => const TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 20,
      );

  List<DataRow> _rows(List<Verb> verbs) {
    List<DataRow> rows = <DataRow>[];

    for (var verb in verbs) {
      rows.add(DataRow(cells: [
        DataCell(Text(
          verb.infinitive,
          style: _style,
        )),
        DataCell(Text(
          verb.past,
          style: _style,
        )),
        DataCell(Text(
          verb.participle,
          style: _style,
        )),
        DataCell(Text(
          verb.translation,
          style: _style,
        )),
      ]));
    }
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    final verbs = VerbsListNotifier.verbsListOf(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                leading: const FlutterLogo(),
                title: Text(
                  'Irregular verbs',
                  style: _style,
                ),
                subtitle: const Text('Main menu'),
              ),
            ),
            Card(
                child: ListTile(
              leading: const Icon(Icons.font_download),
              title: Text(
                'Guess words',
                style: _style,
              ),
              subtitle: const Text("Start guessing irregular verbs"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
            )),
            Card(
                child: ListTile(
              leading: const Icon(Icons.reorder),
              title: Text(
                'Wordlist',
                style: _style,
              ),
              subtitle: const Text("List of irregular verbs"),
              onTap: () {
                Navigator.pop(context);
              },
            ))
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Irregular verbs app")),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: DataTable(
              columns: [
                DataColumn(
                    label: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Infinitive",
                          style: _style,
                        ))),
                DataColumn(
                  label: Center(
                      child: Text(
                    "Past",
                    style: _style,
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    "Participle",
                    style: _style,
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    "Translation",
                    style: _style,
                  )),
                )
              ],
              rows: _rows(verbs),
            ),
          ),
        ),
      ),
    );
  }
}
