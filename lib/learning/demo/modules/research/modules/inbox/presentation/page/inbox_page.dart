import 'package:flutter/material.dart';

import '../../../../core/presentation/navigation.dart';
import '../../../main/presentation/page/main_page.dart';

class ProductDetail extends StatelessWidget {
  final String id;
  final NavbarNotifier _navbarNotifier;

  const ProductDetail(this._navbarNotifier,  {Key? key, this.id = '1'}) : super(key: key);
  static const String route = '/products/detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product $id'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('My AWESOME Product $id'),
          const Center(
            child: Placeholder(
              fallbackHeight: 200,
              fallbackWidth: 300,
            ),
          ),
          TextButton(
              onPressed: () {
                _navbarNotifier.hideBottomNavBar = false;
                // navigate(context, ProductComments.route, isRootNavigator: false, arguments: {'id': id.toString()});
              },
              child: const Text('show comments'))
        ],
      ),
    );
  }
}
