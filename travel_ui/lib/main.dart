import 'package:flutter/material.dart';

import './screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff3EBACE),
          secondary: const Color(0xffD8ECF1),
          background: const Color(0xffF3F5F7),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
