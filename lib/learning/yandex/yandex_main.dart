import 'package:flutter/cupertino.dart';

class StatefulLifecycle extends StatefulWidget {
  final String text;

  const StatefulLifecycle({super.key, required this.text});

  @override
  State<StatefulWidget> createState() => StatefulLifecycleState();
}

class StatefulLifecycleState extends State<StatefulLifecycle> {
  late bool _isShapeCircle;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  void initState() {
    super.initState();
    print('initState');
    _isShapeCircle = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(covariant StatefulLifecycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
