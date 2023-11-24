import 'package:flutter/material.dart';

class MyListViewApp extends StatelessWidget {
  const MyListViewApp({super.key});

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

  void newPost(String text) {
    setState(() {
      posts.add(Post(author: 'Karo', body: text));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Karo flutter'),
      ),
      body: Column(
        children: [
          Expanded(child: PostListWidget(listItems: posts)),
          // Expanded(child: TextInputWidget(callback: newPost)),
          TextInputWidget(callback: newPost),
        ],
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

  const TextInputWidget({super.key, required this.callback});

  // const TextInputWidget({super.key});

  @override
  State<TextInputWidget> createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

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

class Post {
  String body;
  String author;
  int likes = 0;
  bool userLiked = false;

  Post({required this.body, required this.author});

  void likePost() {
    userLiked = !userLiked;
    if (userLiked) {
      likes++;
    } else {
      likes--;
    }
  }
}

class PostListWidget extends StatefulWidget {
  final List<Post> listItems;

  const PostListWidget({super.key, required this.listItems});

  @override
  State<PostListWidget> createState() => _PostListWidgetState();
}

class _PostListWidgetState extends State<PostListWidget> {
  void like(Function callback) {
    setState(() {
      callback();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listItems.length,
      itemBuilder: (context, index) {
        var post = widget.listItems[index];

        return Card(
          child: Row(children: [
            Expanded(
                child: ListTile(
                  title: Text(post.body),
                  subtitle: Text(post.author),
                )),
            Row(
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Text(
                      post.likes.toString(),
                      style: const TextStyle(fontSize: 20),
                    )),
                IconButton(
                  onPressed: () => like(post.likePost),
                  icon: const Icon(Icons.adb),
                  color: post.userLiked ? Colors.green : Colors.black12,)
              ],
            )
          ]),
        );
      },
    );
  }
}
