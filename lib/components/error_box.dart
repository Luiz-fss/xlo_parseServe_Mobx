import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {

  String message;
  ErrorBox({this.message});

  @override
  Widget build(BuildContext context) {
    if(message==null){
      return new Container();
    }else{
     return new Container(
       color: Colors.red,
       child: new Row(
         children: [
           new Icon(
             Icons.error_outline,
             color: Colors.red,
             size: 40,
           ),
           const SizedBox(width: 16,),
           new Expanded(
               child: new Text(
                   "Ooops ! ${message}",
                 style: TextStyle(
                   color: Colors.white,
                   fontSize: 14
                 ),
               )
           )
         ],
       ),
     );
    }
  }
}
