import 'package:flutter/material.dart';

class Date extends StatelessWidget {
  const Date({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      DateTime.now().toString(),
      style: const TextStyle(
        color: Color.fromARGB(255, 248, 250, 250),
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
