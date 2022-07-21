import 'package:flutter/material.dart';

class ColumnCardTile extends StatelessWidget {
  final String title;
  final Widget body;

  const ColumnCardTile({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleLarge;
    return Row(
      children: <Widget>[
        Expanded(
            child: Text(
              title,
              style: style,
            )),
        Expanded(flex: 2, child: body)
      ],
    );
  }
}
