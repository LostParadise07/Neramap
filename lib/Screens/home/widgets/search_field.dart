import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10.0,
          ),
        ),
        color: Color.fromARGB(255, 251, 252, 253),
      ),
      padding: const EdgeInsets.all(
        15.0,
      ),
      child: const Row(
        children: [
          Icon(
            Icons.search,
            size: 20,
            color: Color.fromARGB(255, 102, 5, 144),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            'Search',
            style: TextStyle(
              color: Color.fromARGB(255, 102, 5, 144),
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
