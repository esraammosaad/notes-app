import 'package:flutter/material.dart';

import '../../constents.dart';
import '../../data/models/note_model.dart';
import 'custom_pick_color_note_item.dart';
class CustomEditNoteColorListView extends StatefulWidget {
  const CustomEditNoteColorListView({Key? key, required this.note}) : super(key: key);
  final NoteModel note;


  @override
  State<CustomEditNoteColorListView> createState() => _CustomEditNoteColorListViewState();
}

class _CustomEditNoteColorListViewState extends State<CustomEditNoteColorListView> {
  late int selectedIndex;
  @override
  void initState() {
    selectedIndex=colors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) =>
              CustomPickNoteColorItem(
                color: colors[index],
                onTap: () {
                  selectedIndex = index;
                  widget.note.color=colors[selectedIndex].value;
                  setState(() {});
                },
                index: index,
                selectedIndex: selectedIndex,
              )),
    );
  }
}