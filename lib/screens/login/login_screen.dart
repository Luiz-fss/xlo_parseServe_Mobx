import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xlo_mobx_parse_server/screens/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Entrar"
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            elevation: 8,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //entrar com facebook
                  //divisor

                  //campo email
                  Text(
                    "Acessar com o E-mail",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900]
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 3,bottom: 4, top: 8),
                    child: Text(
                      "E-mail",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      isDense: true
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 16,),
                  //campo senha
                  Padding(
                    padding: const EdgeInsets.only(left: 3,bottom: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Senha ",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        GestureDetector(
                          child: Text(
                            "Esqueceu sua senha?",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple
                            ),
                          ),
                          onTap: (){},
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true
                    ),
                    obscureText: true,
                  ),

                  //botão de login
                  Container(
                    margin: const EdgeInsets.only(top: 20,bottom: 12),
                    height: 40,
                    child: RaisedButton(
                      color: Colors.orange,
                      child: Text(
                        "ENTRAR",
                      ),
                      textColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      onPressed: (){},
                    ),
                  ),

                  Divider(color: Colors.black,),
                  //acessar cadastro
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Wrap(
                      /*Wrap serve para quando não couber na mesma linha
                      * levar o texto para a linha debaixo*/
                      alignment: WrapAlignment.center,
                      children: [
                        const Text(
                          "Não tem uma conta? ",
                          style: TextStyle(
                            fontSize: 16
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=> SignUpScreen()
                            ));
                          },
                          child: Text(
                            "Cadastre-se",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.purple,
                              fontSize: 16
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ),
        ),
      ),
    );
  }
}
