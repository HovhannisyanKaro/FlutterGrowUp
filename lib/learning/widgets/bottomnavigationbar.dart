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

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ProductsMenu extends StatelessWidget {
  const ProductsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class NavbarNotifier extends ChangeNotifier {
  int _index = 0;

  int get index => _index;
  bool _hideBottomNavBar = false;

  set index(int x) {
    _index = x;
    notifyListeners();
  }
}

class AnimatedNavBar extends StatefulWidget {
  final List<MenuItem> menuItems;
  final NavbarNotifier model;
  final Function(int) onItemTaped;

  const AnimatedNavBar(
      {Key? key,
      required this.model,
      required this.menuItems,
      required this.onItemTaped})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => AnimatedNavBarState();
}

class AnimatedNavBarState extends State<AnimatedNavBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  bool isHidden = false;

  @override
  void didUpdateWidget(covariant AnimatedNavBar oldWidget) {
    if (widget.model._hideBottomNavBar != isHidden) {
      if (!isHidden) {
        _showBottomNavBar();
      } else {
        _hideBottomNavBar();
      }
      isHidden = !isHidden;
    }
    super.didUpdateWidget(oldWidget);
  }

  void _hideBottomNavBar() {
    _controller.reverse();
    return;
  }

  void _showBottomNavBar() {
    _controller.forward();
    return;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this)
      ..addListener(() {
        setState(() {});
      });
    animation = Tween(begin: 0.0, end: 100.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
