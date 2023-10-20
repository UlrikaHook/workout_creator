import 'package:flutter/material.dart';

class DialogBuilder extends StatelessWidget {
  final String title;
  final Widget content;
  final List<Widget> actions;

  const DialogBuilder({
    required this.title,
    required this.content,
    required this.actions,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: actions
    );
  }
}