import 'package:flutter/material.dart';

void showText(BuildContext context, String title, String msg) {
  AlertDialog alterdialogue = AlertDialog(
    title: Text(title),
    content: Text(msg),
  );
  showDialog(context: context, builder: (_) => alterdialogue);
}
