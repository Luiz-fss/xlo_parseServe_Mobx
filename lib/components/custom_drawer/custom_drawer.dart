import 'package:flutter/material.dart';
import 'package:xlo_mobx_parse_server/components/custom_drawer/page_section.dart';
import 'custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      /*Com a propriedade horizontal é permetido decidir se quer
      * colar um raio, tanto na esquerda como na direita*/
      borderRadius: BorderRadius.horizontal(right: Radius.circular(50)),
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.65,
          child: Drawer(
            child: ListView(
              children: [
                //header
                CustomDrawerHeader(),
                //paginas
                PageSection()
              ],
            )
          ),
      ),
    );
  }
}
