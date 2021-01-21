import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:xlo_mobx_parse_server/screens/base/base_screen.dart';
import 'package:xlo_mobx_parse_server/stores/page_store.dart';


void main() async{
  /*código para corigir o erro que da ao tentar iniciar o parse sem antes
  * ter iniciado o app*/
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());

}

void setupLocators(){
  /*o get it é um service locator então
  * você utiliza ele para localizar os serviços do seu app
  * e o PageStore é um serviço*/

  /*Sigleton significa que vai exitir só uma instancia
  * no app inteiro, então sempre que for chamado será sempre a mesma*/
  GetIt.I.registerSingleton(PageStore());
  print("setup");
}

Future<void> initializeParse()async{
  await Parse().initialize(
      "Vt0GG9KdzQtJT8TAX2YmRyIG7eWie3nq2wawV7n7",
      "https://parseapi.back4app.com/",
      clientKey: "A5zlk8P4LSvuLi4Sm1mDrfafX10FniuRTINpzy0n",
      autoSendSessionId: true,
      debug: true
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BaseScreen(),
    );
  }
}
