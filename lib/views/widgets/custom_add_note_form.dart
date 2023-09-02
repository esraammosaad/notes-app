import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app/data/models/note_model.dart';

import 'custom_button.dart';
import 'custom_text_form_field.dart';

class CustomAddNoteForm extends StatefulWidget {
  const CustomAddNoteForm({Key? key}) : super(key: key);

  @override
  State<CustomAddNoteForm> createState() => _CustomAddNoteFormState();
}

class _CustomAddNoteFormState extends State<CustomAddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String ?title;
  String ? content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if(state is AddNoteFailure){

            showDialog(context: context, builder: (context)=> SimpleDialog(title: Text(state.errMessage),backgroundColor: Colors.black,contentPadding: EdgeInsets.only(bottom: 16),children: const [
              Center(child: Text('Please Try Again'))
            ],));
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading?true:false,
            child: Column(
              children: [
                const SizedBox(
                  height: 32,
                ),
                CustomTextFormField(
                  onSave: (value) {
                    title=value;
                  },
                  hintText: 'Title',
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomTextFormField(
                  onSave: (value) {
                    content=value;
                  },
                  hintText: 'content',
                  maxLines: 5,
                ),
                const SizedBox(
                  height: 45,
                ),
                CustomButton(onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    NoteModel note=NoteModel(title: title!, content: content!, time: DateTime.now().toString(), color: Colors.black.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                  }
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                }),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}