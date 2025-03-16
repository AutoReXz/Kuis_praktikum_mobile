import 'package:flutter/material.dart';
import 'package:tugas_2_latihan_quiz/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData.light().copyWith(
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 2)),
              labelStyle: TextStyle(color: Colors.black)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.blue),
            foregroundColor: WidgetStatePropertyAll(Colors.white),
            minimumSize: WidgetStatePropertyAll(Size(double.infinity, 50)),
          ))),
      home: const Login(),
    );
  }
}
