import 'package:flutter/material.dart';
import 'package:notes/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:notes/providers/note_provider.dart';

void main() {
  runApp(
    MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>   NotesProvider(),
      child: const MaterialApp(
      home: Home(),

      )
,
    );
  }
}
