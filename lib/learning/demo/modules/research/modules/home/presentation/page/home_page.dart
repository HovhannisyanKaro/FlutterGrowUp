import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertest/learning/demo/modules/research/modules/base/presentation/navigation/navigation.dart';

import '../../../main/presentation/page/main_page.dart';
import '../../../question/details/presentation/page/question_details_page.dart';
import '../widget/question_item_widget.dart';

class HomeFeeds extends StatefulWidget {
  static const String route = '/';
  final NavbarNotifier _navbarNotifier;

  const HomeFeeds(this._navbarNotifier, {Key? key}) : super(key: key);


  @override
  State<HomeFeeds> createState() => _HomeFeedsState(_navbarNotifier);
}

class _HomeFeedsState extends State<HomeFeeds> {
  final _scrollController = ScrollController();
  final NavbarNotifier _navbarNotifier;

  _HomeFeedsState(this._navbarNotifier);

  @override
  void initState() {
    super.initState();
    _addScrollListener();
  }

  void _addScrollListener() {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (_navbarNotifier.hideBottomNavBar) {
          _navbarNotifier.hideBottomNavBar = false;
        }
      } else {
        if (!_navbarNotifier.hideBottomNavBar) {
          _navbarNotifier.hideBottomNavBar = true;
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feeds'),
      ),
      body: ListView.builder(

        controller: _scrollController,
        itemCount: 30,
        itemBuilder: (context, index) {
          return Padding(padding: const EdgeInsets.all(8),
            child: InkWell(
                onTap: () {
                  _navbarNotifier.hideBottomNavBar = false;
                  // navigate(context, FeedDetail.route, isRootNavigator: false, arguments: {'id': index.toString()});
                  navigate(context, QuestionDetailPage.route, isRootNavigator: false, arguments: {"id": index.toString()});
                },
                // child: null);
                child: const QuestionItemWidget())
          );
        },
      ),
    );
  }
}