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
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Hello From Hovhannisyan Karo"),
      ),
    );
  }
}

