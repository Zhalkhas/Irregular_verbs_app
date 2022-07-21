import 'package:flutter/material.dart';

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
