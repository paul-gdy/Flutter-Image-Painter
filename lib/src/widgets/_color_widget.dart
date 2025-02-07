import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    required this.color,
    required this.onTap,
    this.isSelected = false,
    Key? key,
  }) : super(key: key);

  final Color color;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).dividerColor : Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
              radius: 12, backgroundColor: color),
        ),
      ),
    );
  }
}

const List<Color> editorColors = [
  Colors.black,
  Colors.white,
  Colors.red,
  Colors.grey,
  Colors.teal,
  Colors.cyan,
  Colors.blue,
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.green,
  Colors.pink,
  Colors.yellow,
  Colors.orange,
  Colors.brown,
];
