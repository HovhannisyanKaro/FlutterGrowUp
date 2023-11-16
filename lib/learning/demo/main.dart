import 'package:flutter/material.dart';

void main() {
  runApp(const GambleApp());
}

class GambleApp extends StatelessWidget {
  const GambleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GambleHomePage(),
    );
  }
}

class GambleHomePage extends StatefulWidget {
  const GambleHomePage({super.key});

  @override
  State<GambleHomePage> createState() => _GambleHomePageState();
}

class _GambleHomePageState extends State<GambleHomePage> {
  int _selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBarTitle'),
      ),
      body: const Center(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'TOP'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_volleyball), label: 'Sport'),
          BottomNavigationBarItem(icon: Icon(Icons.casino), label: 'Casino'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        onTap: onItemTapped,
      ),
    );
  }
}

class BottomNavigationBarWidget extends StatelessWidget {
  
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
