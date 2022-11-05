import 'package:flutter/material.dart';
import '../constants.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final String title;
  const CategoryItem(
      {super.key, required this.title, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? mainAccent : mainWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        title,
        style: TextStyle(color: isSelected ? mainWhite : mainAccent),
      ),
    );
  }
}
