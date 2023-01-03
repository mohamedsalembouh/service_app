import 'package:flutter/material.dart';

const List<String> items = [
  'tout',
  'Item1',
  'Item2',
  'Item3',
  'Item4',
];

class besoins extends StatelessWidget {
  besoins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Les produits"),
      ),
      body: Column(
        children: [
          mydropdownbutton(),
        ],
      ),
    );
  }
}

class mydropdownbutton extends StatefulWidget {
  const mydropdownbutton({Key? key}) : super(key: key);

  @override
  State<mydropdownbutton> createState() => _mydropdownbutton();
}

class _mydropdownbutton extends State<mydropdownbutton> {
  String dropdownValue = items.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: DropdownButton<String>(
        // hint: Text("$dropdownValue"),
        value: dropdownValue,
        //icon: const Icon(Icons.arrow_downward),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: Container(
          height: 2,
          color: Colors.black,
        ),
        onChanged: (value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        isExpanded: true,
      ),
    );
  }
}
