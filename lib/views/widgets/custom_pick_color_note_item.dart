import 'package:flutter/material.dart';
class CustomPickNoteColorItem extends StatelessWidget {
  const CustomPickNoteColorItem(
      {Key? key,
        required this.color,
        required this.onTap,
        required this.index,
        required this.selectedIndex})
      : super(key: key);
  final Color color;
  final VoidCallback onTap;
  final int index;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: CircleAvatar(
          radius: 27,
          backgroundColor: color,
          child: selectedIndex == index
              ? const Icon(
            Icons.check,
            color: Colors.black,
            size: 32,
          )
              : const Text(''),
        ),
      ),
    );
  }
}
