import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {

  final String label;
  final IconData iconData;
  final VoidCallback onTap;
  final bool highlighted;


  PageTile({this.label, this.iconData, this.onTap, this.highlighted});

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(
          label,
        style: TextStyle(
          color: highlighted==true ? Colors.purple : Colors.black,
          fontWeight: FontWeight.w700
        )
      ),
      leading: new Icon(
        iconData,
        color: highlighted==true ? Colors.purple : Colors.black,
      ),
      onTap: onTap,
    );
  }
}
