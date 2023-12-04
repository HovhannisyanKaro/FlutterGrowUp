import 'package:flutter/material.dart';

import 'modules/main/presentation/page/main_page.dart';

void main() {
  runApp(const ResearchApp());
}

class ResearchApp extends StatelessWidget {
  const ResearchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Research',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NavBarHandler(),
    );
  }
}

List<Color> colors = [mediumPurple, Colors.blue, Colors.red];
const Color mediumPurple = Color.fromRGBO(79, 0, 241, 1.0);

//This is Question Item
// class FeedTile extends StatelessWidget {
//   final int index;
//
//   const FeedTile({Key? key, required this.index}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 300,
//       padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
//       margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
//       color: Colors.grey.withOpacity(0.4),
//       child: Stack(
//         children: [
//           Positioned(
//             top: 4,
//             right: 4,
//             left: 4,
//             child: Container(
//               color: Colors.grey,
//               height: 180,
//             ),
//           ),
//           Positioned(bottom: 12, right: 12, left: 12, child: Text(placeHolderText.substring(0, 200)))
//         ],
//       ),
//     );
//   }
// }
// class ProductList extends StatefulWidget {
//   const ProductList({Key? key}) : super(key: key);
//   static const String route = '/';
//
//   @override
//   State<ProductList> createState() => _ProductListState();
// }
//
// class _ProductListState extends State<ProductList> {
//   final _scrollController = ScrollController();
//
//   @override
//   void initState() {
//     super.initState();
//     _addScrollListener();
//   }
//
//   void _addScrollListener() {
//     _scrollController.addListener(() {
//       if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
//         if (_navbarNotifier.hideBottomNavBar) {
//           _navbarNotifier.hideBottomNavBar = false;
//         }
//       } else {
//         if (!_navbarNotifier.hideBottomNavBar) {
//           _navbarNotifier.hideBottomNavBar = true;
//         }
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Products'),
//       ),
//       body: ListView.builder(
//           controller: _scrollController,
//           itemBuilder: (context, index) {
//             return Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                   onTap: () {
//                     _navbarNotifier.hideBottomNavBar = false;
//                     navigate(context, ProductDetail.route, isRootNavigator: false, arguments: {'id': index.toString()});
//                   },
//                   child: ProductTile(index: index)),
//             );
//           }),
//     );
//   }
// }
// class ProductTile extends StatelessWidget {
//   final int index;
//
//   const ProductTile({Key? key, required this.index}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//         color: Colors.grey.withOpacity(0.5),
//         height: 120,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               margin: const EdgeInsets.all(8),
//               height: 75,
//               width: 75,
//               color: Colors.grey,
//             ),
//             Text('Product $index'),
//           ],
//         ));
//   }
// }
// class ProductComments extends StatelessWidget {
//   final String id;
//
//   const ProductComments({Key? key, this.id = '1'}) : super(key: key);
//   static const String route = '/products/detail/comments';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Comments on Product $id'),
//       ),
//       body: ListView.builder(itemBuilder: (context, index) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: SizedBox(
//             height: 60,
//             child: ListTile(
//               tileColor: Colors.grey.withOpacity(0.5),
//               title: Text('Comment $index'),
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }

// class ProfileEdit extends StatelessWidget {
//   static const String route = '/profile/edit';
//
//   const ProfileEdit({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Profile Edit')),
//       body: const Center(
//         child: Text('Notice this page does not have bottom navigation bar'),
//       ),
//     );
//   }
// }
