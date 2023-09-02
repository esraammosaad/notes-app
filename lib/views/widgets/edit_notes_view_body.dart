import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/data/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_appbar.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';
import 'custom_edit_note_color_list_view.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
                text: 'Edit Note',
                icon: IconButton(
                  onPressed: () {
                    widget.note.title = title ?? widget.note.title;
                    widget.note.content = content ?? widget.note.content;

                    widget.note.save();
                    BlocProvider.of<NotesCubit>(context).fetchData();
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.check),
                )),
            const SizedBox(
              height: 24,
            ),
            CustomTextFormField(
              onChange: (value) {
                title = value;
              },
              hintText: widget.note.title,
              maxLines: 1,
              onSave: (value) {},
            ),
            const SizedBox(
              height: 24,
            ),
            CustomTextFormField(
                onChange: (value) {
                  content = value;
                },
                hintText: widget.note.content,
                maxLines: 5,
                onSave: (value) {}),
            const SizedBox(
              height: 24,
            ),
             CustomEditNoteColorListView(note: widget.note),
          ],
        ),
      ),
    );
  }
}


