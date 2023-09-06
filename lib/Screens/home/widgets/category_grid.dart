import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  const CategoryGrid({Key? key, 
    
    required this.category,
    required this.color, required Null Function() onTap,
  }) : super(key: key);

  final String category;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20,
          ),
          color: color,
        ),
        child: Center(
            child: Text(
          category,
          style: const TextStyle(
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
