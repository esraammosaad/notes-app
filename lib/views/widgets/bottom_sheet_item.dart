import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_text_form_field.dart';

import 'custom_button.dart';

class BottomSheetItem extends StatefulWidget {
  const BottomSheetItem({
    super.key,
  });

  @override
  State<BottomSheetItem> createState() => _BottomSheetItemState();
}

class _BottomSheetItemState extends State<BottomSheetItem> {
  final GlobalKey<FormState> formKey=GlobalKey<FormState>();
   AutovalidateMode autoValidateMode=AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Form(

          key: formKey,
          autovalidateMode: autoValidateMode,
          child:  Column(
            children: [
              const SizedBox(
                height: 32,
              ),
               CustomTextFormField(
                onSave: (value){},
                hintText: 'Title',
                maxLines: 1,
              ),
              const SizedBox(
                height: 24,
              ),
               CustomTextFormField(
                 onSave: (value){

                 },
                hintText: 'content',
                maxLines: 5,
              ),
              const SizedBox(
                height: 45,
              ),
              CustomButton(onTap:(){
                if(formKey.currentState!.validate()){

                  formKey.currentState!.save();


                }
                setState(() {
                  autoValidateMode= AutovalidateMode.always;


                });



              }),
              const SizedBox(height: 16,)
            ],
          ),
        ),
      ),
    );
  }
}
