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
    return new Scaffold(
      body: new PageView(
        controller: pageController,
        physics: new NeverScrollableScrollPhysics(),
        children: [
          new HomeScreen(),
          new Container(color: Colors.black,),
          new Container(color: Colors.amber,),
          new Container(color: Colors.pinkAccent,),
          new Container(color: Colors.tealAccent,),
        ],
      ),
    );
  }
}

