import 'package:flutter/material.dart';

class ItemsNumber extends StatefulWidget {
  const ItemsNumber({Key? key}) : super(key: key);

  @override
  State<ItemsNumber> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<ItemsNumber> {
  String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        color: Colors.grey[200],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          borderRadius: BorderRadius.circular(15.0,),
          dropdownColor: Colors.grey[300],
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['1', '2', '3', '4']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),

            );
          }).toList(),
        ),
      ),
    );
  }
}