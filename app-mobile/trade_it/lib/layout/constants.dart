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
    {required BuildContext context, required String hintText}) {
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
