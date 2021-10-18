import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx_parse_server/screens/login/login_screen.dart';
import 'package:xlo_mobx_parse_server/stores/page_store.dart';
import 'package:xlo_mobx_parse_server/stores/user_manager_store.dart';

class CustomDrawerHeader extends StatelessWidget {

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: (){
        //fechando o drawer para não ficar sobreposto
        Navigator.of(context).pop();
        if(userManagerStore.isLoggedIn){
          GetIt.I<PageStore>().setPage(4);
        }else{
          Navigator.push(context, new MaterialPageRoute(
              builder: (context) => new LoginScreen()
          ));
        }
      },
      child: new Container(
        color: Colors.purple,
        height: 95,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: new Row(
          children: [
            new Icon(Icons.person,color: Colors.white,size: 35,),
            const SizedBox(width: 20,),
            new Expanded(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text(
                    userManagerStore.isLoggedIn ?
                        userManagerStore.user.name :
                    "Acesse sua conta agora!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  new Text(
                    userManagerStore.isLoggedIn ?
                        userManagerStore.user.email :
                    "Clique aqui",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
