import 'package:flutter/material.dart';

class MyDemoApp extends StatelessWidget {
  const MyDemoApp({super.key});

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
      home: const MyHomePage(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Karo flutter'),
//       ),
//       // body: const Text('Hello world from body '),
//       // body: const Column(children: [TestWidget(), TestWidget(), TestWidget()],),
//       // body: const Row(
//       //   children: [TestWidget(), TestWidget(), TestWidget()],
//       // ),
//       body: const TextInputWidget(),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = '';

  void changeText(String text) {
    setState(() {
      this.text = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karo flutter'),
      ),
      // body: const Text('Hello world from body '),
      // body: const Column(children: [TestWidget(), TestWidget(), TestWidget()],),
      // body: const Row(
      //   children: [TestWidget(), TestWidget(), TestWidget()],
      // ),
      body: Column(
        children: [TextInputWidget(callback: changeText), Text(text)],
      ),
    );
  }
}

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('Hello World from TestWidget');
  }
}

class TextInputWidget extends StatefulWidget {

  final Function(String) callback;

  TextInputWidget({required this.callback});

  // const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  // String text = '';

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void changeText(text) {
    if (text == 'Hello World') {
      controller.clear();
      text = '';
    }
    setState(() {
      // this.text = text;
    });
  }

  void onClick() {
    widget.callback(controller.text);
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: const Icon(Icons.accessibility_new_outlined),
          labelText: 'this is label text',
          suffixIcon: IconButton(
              icon: const Icon(Icons.send),
              splashColor: Colors.blue,
              tooltip: 'Post message',
              onPressed: onClick)),
      onChanged: (text) => changeText(text),
    );
  }
}
