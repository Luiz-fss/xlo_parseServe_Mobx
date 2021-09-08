import 'package:flutter/material.dart';
import 'package:xlo_mobx_parse_server/components/custom_drawer/page_section.dart';
import 'custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ClipRRect(
      /*Com a propriedade horizontal é permetido decidir se quer
      * colar um raio, tanto na esquerda como na direita*/
      borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
      child: new SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: new Drawer(
            child: new ListView(
              children: [
                //header
                new CustomDrawerHeader(),
                //paginas
                new PageSection()
              ],
            )
          ),
      ),
    );
  }
}
