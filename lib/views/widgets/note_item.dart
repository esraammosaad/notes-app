import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/data/models/note_model.dart';

import '../edit_notes_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({Key? key, required this.note}) : super(key: key);
  final NoteModel note;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: (){

          Navigator.push(context, MaterialPageRoute(builder: (context)=> EditNotesView(note: note,)));

        },
        child: Container(
          padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(note.color),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title:  Text(
                  note.title,
                  style: const TextStyle(color: Colors.black, fontSize: 24),
                ),
                trailing: IconButton(
                    onPressed: () {
                      note.delete();
                      BlocProvider.of<NotesCubit>(context).fetchData();


                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 24,
                    )),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                  child: Text(note.content,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 16)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Text(
                  note.time.substring(0,16),
                  style:
                      TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 12),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
