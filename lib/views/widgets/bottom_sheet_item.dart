import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_notes_cubit.dart';
import 'custom_add_note_form.dart';


class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(left: 8.0,right: 8,top: 8,bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => AddNoteCubit(),
          child: const CustomAddNoteForm(),
        ),
      ),
    );
  }
}


