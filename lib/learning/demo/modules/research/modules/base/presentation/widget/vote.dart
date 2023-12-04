import 'package:flutter/material.dart';

class Vote extends StatefulWidget {
  const Vote({super.key});

  @override
  State<Vote> createState() => _VoteState();
}

class _VoteState extends State<Vote> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [VoteUpCheckBoxWidget()],
    );
  }
}

class VoteUpCheckBoxWidget extends StatefulWidget {
  const VoteUpCheckBoxWidget({super.key});

  @override
  State<VoteUpCheckBoxWidget> createState() => _VoteUpCheckBoxWidgetState();
}

class _VoteUpCheckBoxWidgetState extends State<VoteUpCheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
