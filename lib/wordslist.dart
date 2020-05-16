import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:irregularverbs/db_helper.dart';
import 'package:irregularverbs/main.dart';

class Wordlist extends StatelessWidget {
  final List<Verb> list;

  Wordlist({Key key, @required this.list}) {
    this.list.sort((a, b) => a.infinitive.compareTo(b.infinitive));
  }

  TextStyle _style() {
    return TextStyle(
      color: Colors.black,
      fontStyle: FontStyle.normal,
      fontSize: 20,
    );
  }

  List<DataRow> _rows() {
    List<DataRow> rows = List<DataRow>();

    list.forEach((element) {
      rows.add(DataRow(cells: [
        DataCell(Text(
          element.infinitive,
          style: _style(),
        )),
        DataCell(Text(
          element.past,
          style: _style(),
        )),
        DataCell(Text(
          element.participle,
          style: _style(),
        )),
        DataCell(Text(
          element.translation,
          style: _style(),
        )),
      ]));
    });
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: FlutterLogo(),
                  title: Text(
                    'Irregular verbs',
                    style: _style(),
                  ),
                  subtitle: Text('Main menu'),
                ),
              ),
              Card(
                  child: ListTile(
                leading: Icon(Icons.font_download),
                title: Text(
                  'Guess words',
                  style: _style(),
                ),
                subtitle: Text("Start guessing irregular verbs"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
              )),
              Card(
                  child: ListTile(
                leading: Icon(Icons.reorder),
                title: Text(
                  'Wordlist',
                  style: _style(),
                ),
                subtitle: Text("List of irregular verbs"),
                onTap: () {
                  Navigator.pop(context);
                },
              ))
            ],
          ),
        ),
        appBar: AppBar(title: Text("Irregular verbs app")),
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
                                  style: _style(),
                                ))),
                        DataColumn(
                          label: Center(
                              child: Text(
                            "Past",
                            style: _style(),
                          )),
                        ),
                        DataColumn(
                          label: Center(
                              child: Text(
                            "Participle",
                            style: _style(),
                          )),
                        ),
                        DataColumn(
                          label: Center(
                              child: Text(
                            "Translation",
                            style: _style(),
                          )),
                        )
                      ],
                      rows: _rows(),
                    )))));
  }
}
