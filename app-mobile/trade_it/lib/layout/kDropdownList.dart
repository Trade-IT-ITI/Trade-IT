import 'package:flutter/material.dart';


class KDropdownList extends StatelessWidget {
  final String label;
  final List<DropdownMenuItem> items;
  final Function(dynamic) onChanged;
  final dynamic value;

  const KDropdownList({Key? key, required this.label, required this.items, required this.onChanged, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200]
      ),
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           Text(label),
          Expanded(
            child: DropdownButtonFormField(
              decoration: const InputDecoration(
                enabled: false,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
              ),
              value: value,
              items: items,
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
