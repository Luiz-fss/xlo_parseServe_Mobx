import 'package:flutter/material.dart';
import 'package:xlo_mobx_parse_server/components/custom_drawer/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SafeArea(
      child: new Scaffold(
        appBar: new AppBar(),
        drawer: new CustomDrawer(),
      ),
    );
  }
}
