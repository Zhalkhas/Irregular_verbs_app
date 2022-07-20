import 'package:flutter/material.dart';
import 'package:irregularverbs/widget/bottom_navbar.dart';
import 'package:irregularverbs/widget/verbs_list_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pastController = TextEditingController();
  final participleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    pastController.dispose();
    participleController.dispose();
    super.dispose();
  }

  void _onClick(BuildContext context) async {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Right! Go on!"),
      ));
      pastController.text = "";
      participleController.text = "";
      VerbsListNotifier.loadNextVerbOf(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Wrong! Try again!"),
      ));
    }
  }

  TextStyle? get _style => Theme.of(context).textTheme.titleLarge;

  TextStyle? get _hintStyle => _style?.copyWith(
        color: Colors.black.withOpacity(0.6),
        fontStyle: FontStyle.italic,
      );

  InputDecoration get inputDecoration => InputDecoration(
      border: const OutlineInputBorder(),
      hintStyle: _hintStyle,
      errorStyle: const TextStyle(height: 0));

  @override
  Widget build(BuildContext context) {
    final isLoading = VerbsListNotifier.isVerbsListLoadingOf(context);
    if (isLoading) {
      return Scaffold(
          body: Center(
        child: Text(
          "Loading...",
          style: _style,
        ),
      ));
    } else {
      final verb = VerbsListNotifier.currentVerbOf(context);
      return Scaffold(
        appBar: AppBar(title: const Text("Irregular verbs app")),
        bottomNavigationBar: const BottomNavbar(),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ColumnCardTile(
                      title: 'Infinitive',
                      body: Center(
                        child: Text(
                          verb.infinitive,
                          style: _style,
                        ),
                      ),
                    ),
                    ColumnCardTile(
                      title: 'Past:',
                      body: TextFormField(
                        validator: (input) {
                          return verb.past == input?.toLowerCase() ? null : '';
                        },
                        decoration: inputDecoration.copyWith(hintText: 'Past'),
                        controller: pastController,
                        style: _style,
                      ),
                    ),
                    ColumnCardTile(
                      title: 'Participle:',
                      body: TextFormField(
                        validator: (input) {
                          return verb.participle == input?.toLowerCase()
                              ? null
                              : '';
                        },
                        decoration:
                            inputDecoration.copyWith(hintText: 'Participle'),
                        controller: participleController,
                        style: _style,
                      ),
                    ),
                    Center(
                      child: SubmitButton(onPressed: () => _onClick(context)),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}

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

class SubmitButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SubmitButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Colors.lightBlue,
        shape: CircleBorder(),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.navigate_next,
          color: Colors.white,
        ),
        tooltip: 'Submit',
        iconSize: 80,
        // onPressed: () => _onClick(context),
      ),
    );
  }
}
