import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/constents.dart';
import 'package:notes_app/views/home_view.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox(hiveBoxName);



  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {

  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.dark,
      fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,

      home:const NotesView(),
    );
  }
}






