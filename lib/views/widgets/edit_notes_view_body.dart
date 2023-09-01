import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_appbar.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({Key? key}) : super(key: key);

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  final GlobalKey<FormState>formKey=GlobalKey();
  AutovalidateMode autoValidateMode=AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 8, right: 8),
      child: Form(
        key: formKey,
        autovalidateMode:autoValidateMode ,
        child: SingleChildScrollView(
          child: Column(
            children: [
               CustomAppBar(text: 'Edit Note',icon: IconButton(onPressed: (){

                 print('object');

                 if(formKey.currentState!.validate()){

                   formKey.currentState!.save();
                 }
                 setState(() {
                   autoValidateMode=AutovalidateMode.always;
                 });
               },icon: const Icon(Icons.check),)),
              const SizedBox(height: 24,),

              CustomTextFormField(hintText: 'Title', maxLines: 1,onSave: (value){},),
              const SizedBox(height: 24,),
              CustomTextFormField(hintText: 'content', maxLines: 5,onSave: (value){}),
            ],
          ),
        ),
      ),
    );
  }
}
