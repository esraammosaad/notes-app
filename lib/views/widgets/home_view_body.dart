import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'note_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0, left: 8, right: 8),
      child: Column(
        children: [
            CustomAppBar(text: 'Notes',icon: IconButton(onPressed: (){},icon: const Icon(Icons.search),)),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) => const NotesItem(),
                itemCount: 4,
          ))
        ],
      ),
    );
  }
}
