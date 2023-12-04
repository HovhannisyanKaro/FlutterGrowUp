import 'package:flutter/material.dart';
import 'package:fluttertest/learning/demo/modules/research/modules/base/presentation/widget/vote.dart';

class QuestionItemWidget extends StatelessWidget {
  const QuestionItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      height: 300,
      child: Stack(
        children: [
          Positioned(
            top: 4,
            right: 4,
            left: 4,
            child: Container(
              color: Colors.red,
              height: 180,
              child: const Vote(),
            ),
          )
        ],
      ),
    );
  }
}
