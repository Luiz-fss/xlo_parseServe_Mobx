import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx_parse_server/screens/signup/signup_screen.dart';
import 'package:xlo_mobx_parse_server/stores/login_store.dart';

class LoginScreen extends StatelessWidget {

  final LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text(
          "Entrar"
        ),
        centerTitle: true,
      ),
      body: new Container(
        alignment: Alignment.center,
        child: new SingleChildScrollView(
          child: new Card(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
            ),
            elevation: 8,
            child: new Padding(
              padding: const EdgeInsets.all(16),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //entrar com facebook
                  //divisor

                  //campo email
                  new Text(
                    "Acessar com o E-mail",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[900]
                    ),
                  ),

                  new Padding(
                    padding: const EdgeInsets.only(left: 3,bottom: 4, top: 8),
                    child: new Text(
                      "E-mail",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  new Observer(builder: (_){
                    return new TextField(
                      enabled: !loginStore.loading,
                      decoration: new InputDecoration(
                          border: const OutlineInputBorder(),
                          isDense: true,
                          errorText: loginStore.emailError
                      ),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: loginStore.setEmail,
                    );
                  }),
                  const SizedBox(height: 16,),
                  //campo senha
                  new Padding(
                    padding: const EdgeInsets.only(left: 3,bottom: 4),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new Text(
                          "Senha ",
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        new GestureDetector(
                          child: new Text(
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
                  new Observer(builder: (_){
                  return new TextField(
                    enabled: !loginStore.loading,
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(),
                        isDense: true,
                        errorText: loginStore.passwordError
                    ),
                    obscureText: true,
                    onChanged: loginStore.setPassword,
                  );
                  }
                  ),

                  //botão de login
                  Observer(builder: (_){
                    return new Container(
                      margin: const EdgeInsets.only(top: 20,bottom: 12),
                      height: 40,
                      child: new RaisedButton(
                        color: Colors.orange,
                        disabledColor: Colors.orange.withAlpha(120),
                        child: loginStore.loading ?
                        new CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation(Colors.white),
                        ) : new Text(
                          "ENTRAR",
                        ),
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),
                        onPressed: loginStore.loginPresed,
                      ),
                    );
                  }),

                  const Divider(color: Colors.black,),
                  //acessar cadastro
                  new Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: new Wrap(
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
                        new GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context)=> new SignUpScreen()
                            ));
                          },
                          child: new Text(
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
