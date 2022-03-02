import 'package:flutter/material.dart';

import './home_page.dart';
import './search_pade.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram UI clone',
      theme: ThemeData(
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(40, 40, 40, 1),
        ),
        appBarTheme: const AppBarTheme(
          elevation: 1,
          color: Colors.white,
          iconTheme: IconThemeData(
            color: Color.fromRGBO(40, 40, 40, 1),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage == 1 ? const SearchPage() : const HomePage(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            const Spacer(),
            IconButton(
              icon: Icon(
                Icons.home,
                color: _currentPage == 0
                    ? const Color.fromRGBO(203, 73, 101, 1)
                    : const Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  _currentPage = 0;
                });
              },
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                Icons.search,
                color: _currentPage == 1
                    ? const Color.fromRGBO(203, 73, 101, 1)
                    : const Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  _currentPage = 1;
                });
              },
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                Icons.ondemand_video,
                color: _currentPage == 2
                    ? const Color.fromRGBO(203, 73, 101, 1)
                    : const Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  _currentPage = 2;
                });
              },
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                Icons.card_travel,
                color: _currentPage == 3
                    ? const Color.fromRGBO(203, 73, 101, 1)
                    : const Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  _currentPage = 3;
                });
              },
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                Icons.person,
                color: _currentPage == 4
                    ? const Color.fromRGBO(203, 73, 101, 1)
                    : const Color.fromRGBO(40, 40, 40, 1),
              ),
              onPressed: () {
                setState(() {
                  _currentPage = 4;
                });
              },
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
