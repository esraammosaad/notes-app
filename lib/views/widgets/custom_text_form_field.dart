import 'package:flutter/material.dart';

import '../../constents.dart';
class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.maxLines, required this.onSave,
  });
  final String hintText;
  final int maxLines;
  final void Function(String?) onSave;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved:onSave,
      validator: (value){

        if(value!.isEmpty){
          return 'please enter valid value';



        }
        return null;
      },
      maxLines: maxLines,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: kPrimaryColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.white)),
      ),
    );
  }
}