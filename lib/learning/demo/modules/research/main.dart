import 'package:flutter/material.dart';

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
      home: const ResearchHomePage(),
    );
  }
}

class ResearchHomePage extends StatefulWidget {
  const ResearchHomePage({super.key});

  @override
  State<ResearchHomePage> createState() => _ResearchHomePage();
}

class _ResearchHomePage extends State<ResearchHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class BottomNavigationBarItem {
  const BottomNavigationBarItem(this.iconData, this.text);

  final IconData iconData;
  final String text;
}

final homeKey = GlobalKey<NavigatorState>();


class NavBarHandler extends StatefulWidget {
  const NavBarHandler({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<NavBarHandler> createState() => _NavBarHandlerState();
}

class _NavBarHandlerState extends State<NavBarHandler> with SingleTickerProviderStateMixin {

  final _buildBody = const <Widget>[HomeMenu(), ProductsMenu(), ProfileMenu()];
}

class HomeMenu extends StatelessWidget {
  const HomeMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(colorScheme: Theme
          .of(context)
          .colorScheme),
      child: Navigator(
          key: homeKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            switch (settings.name) {
              case '/':
                builder = (BuildContext _) => const HomePage();
                break;
            }
          }
      ),
    )
  }
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: ,),
    );
  }
}


