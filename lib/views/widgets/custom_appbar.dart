import 'package:flutter/material.dart';

import 'custom_search_icon.dart';
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.text, required this.icon}) : super(key: key);
  final String text;
  final IconButton icon;

  @override
  Widget build(BuildContext context) {
    return   Row(
      children: [

        Text( text,style: const TextStyle(
          fontSize: 30,
        ),

        ),
        const Spacer(flex: 1,),
         CustomSearchIcon(icon:icon),

      ],


    );
  }
}