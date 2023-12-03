import 'package:flutter/cupertino.dart';

Future<void> navigate(BuildContext context, String route, {bool isDialog = false, bool isRootNavigator = true, Map<String, dynamic>? arguments}) => Navigator.of(context, rootNavigator: isRootNavigator).pushNamed(route, arguments: arguments);