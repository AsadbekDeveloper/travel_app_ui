import 'package:flutter/material.dart';
import 'constants.dart';
import './screens/home_page.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: mainAccent),
          scaffoldBackgroundColor: bgWhite,
        ),
        home: const HomePage());
  }
}
