import 'package:flutter/material.dart';
import 'package:xlo_mobx_parse_server/screens/home/home_screen.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();
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
