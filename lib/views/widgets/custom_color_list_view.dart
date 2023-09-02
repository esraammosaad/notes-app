import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constents.dart';
import '../../cubits/add_notes_cubit/add_notes_cubit.dart';
import 'custom_pick_color_note_item.dart';
class CustomColorListView extends StatefulWidget {
  const CustomColorListView({Key? key}) : super(key: key);

  @override
  State<CustomColorListView> createState() => _CustomColorListViewState();
}

class _CustomColorListViewState extends State<CustomColorListView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 55,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) =>
              CustomPickNoteColorItem(
                color: colors[index],
                onTap: () {
                  selectedIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color = colors[selectedIndex];

                  setState(() {});
                },
                index: index,
                selectedIndex: selectedIndex,
              )),
    );
  }
}

