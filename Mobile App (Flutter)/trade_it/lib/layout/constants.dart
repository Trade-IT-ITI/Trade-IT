import 'package:flutter/material.dart';

import '../models/filter.dart';
import '../screens/search/search_ui.dart';

void filterPage(BuildContext context, FilterData filterOBJ) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Search(
        filterDataOBJ: filterOBJ,
      ),
    ),
  );
}

InputDecoration inputStyle(
    {required BuildContext context, String hintText = ""}) {
  return InputDecoration(
    focusedErrorBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).colorScheme.error, width: 1.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).colorScheme.error, width: 1.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary, width: 1.0),
    ),
    labelText: hintText,
  );
}

successSnackBar({required BuildContext context, required String title}) async {
  SnackBar snackBar = SnackBar(
    content: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
    duration: const Duration(
      seconds: 2,
    ),
    backgroundColor: Colors.green,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

alertDialog({
  required BuildContext context,
  required String title,
  String body = "",
}) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
