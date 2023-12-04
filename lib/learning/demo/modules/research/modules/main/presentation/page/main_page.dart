import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../main.dart';
import '../../../base/presentation/navigation/bottom_navigation_bar.dart';
import '../../../home/presentation/page/home_page.dart';
import '../../../profile/presentation/page/profile_page.dart';

final homeKey = GlobalKey<NavigatorState>();
final productsKey = GlobalKey<NavigatorState>();
final profileKey = GlobalKey<NavigatorState>();

final NavbarNotifier _navbarNotifier = NavbarNotifier();

class NavbarNotifier extends ChangeNotifier {
  int _index = 0;

  int get index => _index;
  bool _hideBottomNavBar = false;

  set index(int x) {
    _index = x;
    notifyListeners();
  }

  bool get hideBottomNavBar => _hideBottomNavBar;

  set hideBottomNavBar(bool x) {
    _hideBottomNavBar = x;
    notifyListeners();
  }

  // pop routes from the nested navigator stack and not the main stack
  // this is done based on the currentIndex of the bottom navbar
  // if the backButton is pressed on the initial route the app will be terminated
  FutureOr<bool> onBackButtonPressed() async {
    bool exitingApp = true;
    switch (_navbarNotifier.index) {
      case 0:
        if (homeKey.currentState != null && homeKey.currentState!.canPop()) {
          homeKey.currentState!.pop();
          exitingApp = false;
        }
        break;
      case 1:
        if (productsKey.currentState != null && productsKey.currentState!.canPop()) {
          productsKey.currentState!.pop();
          exitingApp = false;
        }
        break;
      case 2:
        if (profileKey.currentState != null && profileKey.currentState!.canPop()) {
          profileKey.currentState!.pop();
          exitingApp = false;
        }
        break;
      default:
        return false;
    }
    if (exitingApp) {
      return true;
    } else {
      return false;
    }
  }

  // pops all routes except first, if there are more than 1 route in each navigator stack
  void popAllRoutes(int index) {
    switch (index) {
      case 0:
        if (homeKey.currentState!.canPop()) {
          homeKey.currentState!.popUntil((route) => route.isFirst);
        }
        return;
      case 1:
        if (productsKey.currentState!.canPop()) {
          productsKey.currentState!.popUntil((route) => route.isFirst);
        }
        return;
      case 2:
        if (profileKey.currentState!.canPop()) {
          profileKey.currentState!.popUntil((route) => route.isFirst);
        }
        return;
      default:
        break;
    }
  }
}

class AnimatedNavBar extends StatefulWidget {
  const AnimatedNavBar({Key? key, required this.model, required this.menuItems, required this.onItemTapped}) : super(key: key);
  final List<BottomNavigationBarItemUI> menuItems;
  final NavbarNotifier model;
  final Function(int) onItemTapped;

  @override
  _AnimatedNavBarState createState() => _AnimatedNavBarState();
}

class _AnimatedNavBarState extends State<AnimatedNavBar> with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(covariant AnimatedNavBar oldWidget) {
    if (widget.model.hideBottomNavBar != isHidden) {
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
    _controller = AnimationController(duration: const Duration(milliseconds: 500), vsync: this)..addListener(() => setState(() {}));
    animation = Tween(begin: 0.0, end: 100.0).animate(_controller);
  }

  late AnimationController _controller;
  late Animation<double> animation;
  bool isHidden = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(0, animation.value),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: const Offset(2, -2),
                ),
              ]),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.shifting,
                currentIndex: widget.model.index,
                onTap: (x) {
                  widget.onItemTapped(x);
                },
                elevation: 16.0,
                showUnselectedLabels: true,
                unselectedItemColor: Colors.white54,
                selectedItemColor: Colors.white,
                items: widget.menuItems
                    .map((BottomNavigationBarItemUI menuItem) => BottomNavigationBarItem(
                          backgroundColor: colors[widget.model.index],
                          icon: Icon(menuItem.iconData),
                          label: menuItem.text,
                        ))
                    .toList(),
              ),
            ),
          );
        });
  }
}

class NavBarHandler extends StatefulWidget {
  const NavBarHandler({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<NavBarHandler> createState() => _NavBarHandlerState();
}

class _NavBarHandlerState extends State<NavBarHandler> with SingleTickerProviderStateMixin {
  final _buildBody = <Widget>[HomeNavigationMenu(globalKey: homeKey), const ProductsMenu(), const ProfileMenu()];

  final menuItemList = const <BottomNavigationBarItemUI>[
    BottomNavigationBarItemUI(Icons.home, 'Home'),
    BottomNavigationBarItemUI(Icons.shopping_basket, 'Products'),
    BottomNavigationBarItemUI(Icons.person, 'Me'),
  ];

  late Animation<double> fadeAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    fadeAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );
    _controller.forward();
  }

  void showSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 600),
        margin: EdgeInsets.only(bottom: kBottomNavigationBarHeight, right: 2, left: 2),
        content: Text('Tap back button again to exit'),
      ),
    );
  }

  void hideSnackBar() {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  DateTime oldTime = DateTime.now();
  DateTime newTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final bool isExitingApp = await _navbarNotifier.onBackButtonPressed();
        if (isExitingApp) {
          newTime = DateTime.now();
          int difference = newTime.difference(oldTime).inMilliseconds;
          oldTime = newTime;
          if (difference < 1000) {
            hideSnackBar();
            return isExitingApp;
          } else {
            showSnackBar();
            return false;
          }
        } else {
          return isExitingApp;
        }
      },
      child: Material(
        child: AnimatedBuilder(
            animation: _navbarNotifier,
            builder: (context, snapshot) {
              return Stack(
                children: [
                  IndexedStack(
                    index: _navbarNotifier.index,
                    children: [for (int i = 0; i < _buildBody.length; i++) FadeTransition(opacity: fadeAnimation, child: _buildBody[i])],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: AnimatedNavBar(
                        model: _navbarNotifier,
                        onItemTapped: (x) {
                          // User pressed  on the same tab twice
                          if (_navbarNotifier.index == x) {
                            _navbarNotifier.popAllRoutes(x);
                          } else {
                            _navbarNotifier.index = x;
                            _controller.reset();
                            _controller.forward();
                          }
                        },
                        menuItems: menuItemList),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class ProductsMenu extends StatelessWidget {
  const ProductsMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(colorScheme: Theme.of(context).colorScheme.copyWith(primary: colors[1])),
      child: Navigator(
        key: productsKey,
        initialRoute: '/',
        // onGenerateRoute: (RouteSettings settings) {
        //   WidgetBuilder builder;
        //   switch (settings.name) {
        //     case '/':
        //       builder = (BuildContext _) => const ProductList();
        //       break;
        //     // case ProductDetail.route:
        //     //   final id = (settings.arguments as Map)['id'];
        //     //   builder = (BuildContext _) {
        //     //     return ProductDetail(
        //     //       id: id,
        //     //     );
        //     //   };
        //     //   break;
        //     // case ProductComments.route:
        //     //   final id = (settings.arguments as Map)['id'];
        //     //   builder = (BuildContext _) {
        //     //     return ProductComments(
        //     //       id: id,
        //     //     );
        //     //   };
        //     //   break;
        //     default:
        //       builder = (BuildContext _) => const ProductList();
        //   }
        //   return MaterialPageRoute(builder: builder, settings: settings);
        // },
      ),
    );
  }
}

class HomeNavigationMenu extends StatelessWidget {
  final GlobalKey<NavigatorState> globalKey;

  const HomeNavigationMenu({required this.globalKey, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(colorScheme: Theme.of(context).colorScheme),
      child: Navigator(
          key: globalKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            switch (settings.name) {
              case '/':
                builder = (BuildContext _) => HomeFeeds(_navbarNotifier);
                break;
              // case FeedDetail.route:
              //   builder = (BuildContext _) {
              //     final id = (settings.arguments as Map)['id'];
              //     return FeedDetail(
              //       feedId: id,
              //     );
              //   };
              //   break;
              default:
                builder = (BuildContext _) => HomeFeeds(_navbarNotifier);
            }
            return MaterialPageRoute(builder: builder, settings: settings);
          }),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(colorScheme: Theme.of(context).colorScheme.copyWith(primary: colors[2])),
      child: Navigator(
          key: profileKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            switch (settings.name) {
              case '/':
                builder = (BuildContext _) => const ProfilePage();
                break;
              // case ProfileEdit.route:
              //   builder = (BuildContext _) => const ProfileEdit();
              //   break;
              default:
                builder = (BuildContext _) => const ProfilePage();
            }
            return MaterialPageRoute(builder: builder, settings: settings);
          }),
    );
  }
}
