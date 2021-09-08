import 'package:flutter/material.dart';
import 'package:xlo_mobx_parse_server/screens/login/login_screen.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: (){
        //fechando o drawer para não ficar sobreposto
        Navigator.of(context).pop();
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => new LoginScreen()
        ));
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
                    "Acesse sua conta agora!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  new Text(
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
