import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/data/models/note_model.dart';
import 'custom_appbar.dart';
import 'note_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        List<NoteModel>notes=BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.only(top: 32.0, left: 10, right: 10),
          child: Column(
            children: [
              CustomAppBar(
                  text: 'Notes',
                  icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  )),
              Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) =>  NotesItem(note: notes[index]),
                    itemCount: notes.length,
                  ))
            ],
          ),
        );
      },
    );
  }
}
