import 'package:flutter/material.dart';
import 'package:newstr/components/constants.dart';
import 'package:newstr/views/trpage/trpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
      ),
      debugShowCheckedModeBanner: false,
      title: 'News',
      home: const HomeScreen(),
    );
  }
}
