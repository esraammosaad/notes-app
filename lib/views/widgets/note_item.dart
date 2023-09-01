import 'package:flutter/material.dart';

import '../edit_notes_view.dart';

class NotesItem extends StatelessWidget {
  const NotesItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: GestureDetector(
        onTap: (){

          Navigator.push(context, MaterialPageRoute(builder: (context)=>const EditNotesView()));

        },
        child: Container(
          padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.orange,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: const Text(
                  'Flutter Tips',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black,
                      size: 24,
                    )),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 16),
                  child: Text('Build your career with tharwat samy',
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.5), fontSize: 16)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: Text(
                  'Sep25, 2023',
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
