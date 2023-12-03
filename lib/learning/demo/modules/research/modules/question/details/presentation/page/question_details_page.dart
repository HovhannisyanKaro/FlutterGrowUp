import 'package:flutter/material.dart';

class QuestionDetailPage extends StatelessWidget {
  final String feedId;

  const QuestionDetailPage({Key? key, this.feedId = '1'}) : super(key: key);
  static const String route = '/feeds/detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed $feedId'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Placeholder(
                fallbackHeight: 200,
                fallbackWidth: 300,
              ),
              Text(_placeHolderText),
            ],
          ),
        ),
      ),
    );
  }
}

const String _placeHolderText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
