import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx_parse_server/components/error_box.dart';
import 'package:xlo_mobx_parse_server/screens/signup/components/field_title.dart';
import 'package:xlo_mobx_parse_server/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {

  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text(
            "Cadastro"
        ),
        centerTitle: true,
      ),
      body: new Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: new Padding(
            padding: const EdgeInsets.only(bottom: 16),
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
                    new Observer(
                      builder: (_){
                        return new ErrorBox(
                          message: signupStore.error
                        );
                      },
                    ),
                    new FieldTitle(
                      title: "Apelido",
                      subtitle: "Como aparecerá em seus anuncios",
                    ),
                    new Observer(
                        builder: (_){
                          return new TextField(
                            enabled: !signupStore.loading,
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(),
                                hintText: "Exemplo Luiz F.",
                                isDense: true,
                                errorText: signupStore.nameErro
                            ),
                            onChanged: signupStore.setName,
                          );
                        }),
                    const SizedBox(height: 16,),
                    new FieldTitle(
                      title: "E-mail",
                      subtitle: "Enviaremos um e-mail de confirmação",
                    ),
                    new Observer(
                      builder: (_){
                        return new TextField(
                          enabled: !signupStore.loading,
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(),
                              hintText: "luiz@gmail.com",
                              errorText: signupStore.emailErro,
                              isDense: true
                          ),
                          onChanged: signupStore.setEmail,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                        );
                      },
                    ),
                    const SizedBox(height: 16,),
                    new FieldTitle(
                      title: "Celular",
                      subtitle: "Proteja sua conta",
                    ),
                    new Observer(
                      builder: (_){
                        return new TextField(
                          enabled: !signupStore.loading,
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(),
                              hintText: "(99)99999-9999",
                              errorText: signupStore.phoneError,
                              isDense: true
                          ),
                          onChanged: signupStore.setPhone,
                          keyboardType: TextInputType.phone,
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter()
                          ],
                        );
                      },
                    ),

                    const SizedBox(height: 16,),

                    new FieldTitle(
                      title: "Senha",
                      subtitle: "Use letras, números e caracteres especiais",
                    ),
                    new Observer(
                        builder: (_){
                          return new TextField(
                            enabled: !signupStore.loading,
                            decoration: new InputDecoration(
                                border: new OutlineInputBorder(),
                                errorText: signupStore.pass1Error,
                                isDense: true
                            ),
                            onChanged: signupStore.setPass1,
                            obscureText: true,
                          );
                        }),
                    const SizedBox(height: 16,),
                    new FieldTitle(
                      title: "Confirmar Senha",
                      subtitle: "Repita a senha",
                    ),
                    new Observer(
                      builder: (_){
                        return new TextField(
                          enabled: !signupStore.loading,
                          decoration: new InputDecoration(
                              border: new OutlineInputBorder(),
                              errorText: signupStore.pass2Error,
                              isDense: true
                          ),
                          onChanged: signupStore.setPass2,
                          obscureText: true,
                        );
                      },
                    ),
                    //const SizedBox(height: 16,),
                    //botão
                    new Observer(
                      builder: (_){
                        return new Container(
                          margin: const EdgeInsets.only(top: 20,bottom: 12),
                          height: 40,
                          child: new RaisedButton(
                            color: Colors.orange,
                            disabledColor: Colors.orange.withAlpha(120),
                            child:signupStore.loading ?
                            new CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation(Colors.white),
                            ) : new Text(
                              "CADASTRAR",
                            ),
                            textColor: Colors.white,
                            elevation: 0,
                            shape: new RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            onPressed: signupStore.signUpPressed
                          ),
                        );
                      },
                    ),

                    new Divider(color: Colors.black,),

                    new Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const  Text(
                            "Já tem uma conta ?",
                            style:  TextStyle(
                              fontSize: 16
                            ),
                          ),
                          new GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: new Text(
                              "Entrar",
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}
