import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'learning/demo/core/utils/api_wrapper.dart';

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

  @override
  void initState() {
    super.initState();
    // testSwitchWithGenericTypeOfSealed();
    testSwitchWithGenericTypeOfSealedWithGeneric<String>(Success<String>(value: ''));
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void testSwitchWithGenericTypeOfSealed() {
    final successSealedSub = Success<String>(value: '');

    switch (successSealedSub) {
      case Success<String>():
        {
          print('HK_LOG: CASE_SUCCESS');
          break;
        }
      default:
        {
          print('HK_LOG: CASE_DEFAULT');
          break;
        }

        final value = switch (successSealedSub) {
          Success<String>() => null,
        };
    }
  }

  void testSwitchWithGenericTypeOfSealedWithGeneric<T>(ApiWrapper apiWrapper) {
    // final successSealedSub = Success<String>(value: '');

    switch (apiWrapper) {
      case Success<T>():
        {
          print('HK_LOG: CASE_SUCCESS');
          break;
        }
      default:
        {
          print('HK_LOG: CASE_DEFAULT');
          break;
        }
    }

    final value = switch (apiWrapper) {
      Success<String>() => null,
      _ => null,
    };
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
