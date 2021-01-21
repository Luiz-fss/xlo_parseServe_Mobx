import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:xlo_mobx_parse_server/screens/home/home_screen.dart';
import 'package:xlo_mobx_parse_server/stores/page_store.dart';

class BaseScreen extends StatefulWidget {

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();
  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    reaction(
          (_) => pageStore.page,
          (page)=> pageController.jumpToPage(page)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomeScreen(),
          Container(color: Colors.black,),
          Container(color: Colors.amber,),
          Container(color: Colors.pinkAccent,),
          Container(color: Colors.tealAccent,),
        ],
      ),
    );
  }
}
