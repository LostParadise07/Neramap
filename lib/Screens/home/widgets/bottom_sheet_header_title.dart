import 'package:flutter/material.dart';

class BottomSheetHeaderTitle extends StatelessWidget {
  final String titleText;
  const BottomSheetHeaderTitle({
    Key? key,
    required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Icon(
          Icons.more_horiz,
          size: 30,
        )
      ],
    );
  }
}
