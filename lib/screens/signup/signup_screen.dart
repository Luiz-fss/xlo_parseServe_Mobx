import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx_parse_server/screens/signup/components/field_title.dart';
import 'package:xlo_mobx_parse_server/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {

  final SignupStore signupStore = SignupStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            "Cadastro"
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16),
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
                    FieldTitle(
                      title: "Apelido",
                      subtitle: "Como aparecerá em seus anuncios",
                    ),
                    Observer(
                        builder: (_){
                          return TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Exemplo Luiz F.",
                                isDense: true,
                                errorText: signupStore.nameErro
                            ),
                            onChanged: signupStore.setName,
                          );
                        }),

                    const SizedBox(height: 16,),

                    FieldTitle(
                      title: "E-mail",
                      subtitle: "Enviaremos um e-mail de confirmação",
                    ),
                    Observer(
                      builder: (_){
                        return TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "luiz@gmail.com",
                              errorText: signupStore.emailErro,
                              isDense: true
                          ),
                          onChanged: signupStore.setEmail,
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                        );
                      },),
                    const SizedBox(height: 16,),


                    FieldTitle(
                      title: "Celular",
                      subtitle: "Proteja sua conta",
                    ),
                    Observer(
                      builder: (_){
                        return TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
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


                    FieldTitle(
                      title: "Senha",
                      subtitle: "Use letras, números e caracteres especiais",
                    ),
                    Observer(
                        builder: (_){
                          return TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                errorText: signupStore.pass1Error,
                                isDense: true
                            ),
                            onChanged: signupStore.setPass1,
                            obscureText: true,
                          );
                        }),


                    const SizedBox(height: 16,),
                    FieldTitle(
                      title: "Confirmar Senha",
                      subtitle: "Repita a senha",
                    ),
                    Observer(
                      builder: (_){
                        return TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
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
                    Container(
                      margin: const EdgeInsets.only(top: 20,bottom: 12),
                      height: 40,
                      child: RaisedButton(
                        color: Colors.orange,
                        child: Text(
                          "CADASTRAR",
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

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Já tem uma conta ?",
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Text(
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
