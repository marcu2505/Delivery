import 'package:flutter/material.dart';

showMessageDialog({
  @required BuildContext context,
  @required String message,
  String detail,
}) async {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(message),
        content: detail != null ? Text(detail) : null,
        actions: [
          FlatButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
