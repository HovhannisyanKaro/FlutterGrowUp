import 'package:flutter/material.dart';

void main() {
  runApp(const ResearchApp());
}

class ResearchApp extends StatelessWidget {
  const ResearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Research',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ResearchHomePage(),
    );
  }
}

class ResearchHomePage extends StatefulWidget {
  const ResearchHomePage({super.key});

  @override
  State<ResearchHomePage> createState() => _ResearchHomePage();
}

class _ResearchHomePage extends State<ResearchHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
