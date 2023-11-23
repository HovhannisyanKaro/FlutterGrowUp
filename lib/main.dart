import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'learning/api/retrofit/api_service.dart';

void main() {
  runApp(const MyApp());
  // runApp(const MyListViewApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final Dio _dio = Dio();
  // final ApiService _apiService = ApiService(_dio);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const GambleHomePage(),
      home: const MyHomePage(title: 'Simple Title'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // late Future<String> futureStringCasinoGames ;

  @override
  void initState() {
    super.initState();
    // futureStringCasinoGames = fetchCasinoGames();
    // print('HK_LOG, casinoGamesResponse: $futureStringCasinoGames');
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
