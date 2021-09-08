import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx_parse_server/components/custom_drawer/page_tile.dart';
import 'package:xlo_mobx_parse_server/stores/page_store.dart';

class PageSection extends StatelessWidget {

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new PageTile(
          label: "Anúncios",
          iconData: Icons.list,
          onTap:(){
            print("chamou");
            pageStore.setPage(0);
          },
          highlighted: pageStore.page == 0
        ),
        new PageTile(
            label: "Inserir Anúncio",
            iconData: Icons.edit,
            onTap:(){
              pageStore.setPage(1);
            },
            highlighted: pageStore.page == 1
        ),
        new PageTile(
            label: "Chat",
            iconData: Icons.chat,
            onTap:(){
              print("chamou");
              print(pageStore);
              pageStore.setPage(2);
              print(pageStore);
            },
            highlighted: pageStore.page == 2
        ),
        new PageTile(
            label: "Favoritos",
            iconData: Icons.favorite,
            onTap:(){
              print("chamou");
              pageStore.setPage(3);
            },
            highlighted: pageStore.page == 3
        ),
        new PageTile(
            label: "Minha Conta",
            iconData: Icons.person,
            onTap:(){
              print("chamou");
              pageStore.setPage(4);
            },
            highlighted: pageStore.page == 4
        ),
      ],
    );
  }
}
