import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constents.dart';
import 'package:notes_app/data/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel> ? notes;

  fetchData(){

    var box=Hive.box<NoteModel>(hiveBoxName);
    notes = box.values.toList();
    emit(NotesAdd());
  }

}
