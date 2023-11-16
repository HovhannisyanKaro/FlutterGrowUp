import 'package:flutter/material.dart';

void main() {
  runApp(const BottomNavigationBarApp());
}

class BottomNavigationBarApp extends StatelessWidget {
  const BottomNavigationBarApp({super.key});

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
      home: const BottomNavigationBarHomePage(),
    );
  }
}

class BottomNavigationBarHomePage extends StatefulWidget {
  const BottomNavigationBarHomePage({super.key});

  static const String route = '/';

  @override
  State<BottomNavigationBarHomePage> createState() =>
      _BottomNavigationBarHomePageState();
}

class _BottomNavigationBarHomePageState
    extends State<BottomNavigationBarHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: index,
        onTap: (x) {
          setState(() {
            index = x;
          });
        },
        elevation: 16.0,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        items: menuItemList
            .map((MenuItem menuItem) => BottomNavigationBarItem(
                icon: Icon(menuItem.iconData), label: menuItem.text))
            .toList(),
      ),
      body: IndexedStack(
        index: index,
        children: _buildBody,
      ),
    );
  }
}

class MenuItem {
  final IconData iconData;
  final String text;

  const MenuItem(this.iconData, this.text);
}

const menuItemList = <MenuItem>[
  MenuItem(Icons.home, 'Home'),
  MenuItem(Icons.shopping_basket, 'Products'),
  MenuItem(Icons.person, 'Me')
];

const _buildBody = <Widget>[HomeMenu(), ProductsMenu(), ProfileMenu()];

// class NavBarHandler extends StatefulWidget {
//   const NavBarHandler({super.key});
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }

class HomeMenu extends StatelessWidget{
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ProductsMenu extends StatelessWidget{
  const ProductsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ProfileMenu extends StatelessWidget{
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}