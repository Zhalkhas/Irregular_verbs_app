import 'package:flutter/material.dart';
import 'package:irregularverbs/screen/home/submit_button.dart';
import 'package:irregularverbs/screen/home/verb_input_field.dart';
import 'package:irregularverbs/widget/bottom_navbar.dart';
import 'package:irregularverbs/widget/verbs_list_notifier.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final infinitiveController = TextEditingController();
  final pastController = TextEditingController();
  final participleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    infinitiveController.dispose();
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
                    VerbInputField(
                      label: 'Infnitive',
                      controller: infinitiveController,
                      readOnly: true,
                      initialValue: verb.infinitive,
                    ),
                    VerbInputField(
                      label: 'Past',
                      controller: pastController,
                      validator: (input) =>
                          verb.past == input?.toLowerCase() ? null : '',
                    ),
                    VerbInputField(
                      label: 'Participle',
                      controller: participleController,
                      validator: (input) =>
                          verb.participle == input?.toLowerCase() ? null : '',
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
