import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStore with _$SignupStore;

abstract class _SignupStore with Store{

  _SignupStore(){
    autorun((_){
      print(pass1);
      print(pass2);
      print(pass2Valid);
    });
  }

  //campo de nome
  @observable
  String name;

  @action
  void setName (String value) => name = value;

  @computed
  bool get namedValid => name != null && name.length >6;
  String get nameErro {
    if(name == null || namedValid){
      return null;
    }else if(name.isEmpty){
      return "Campo obrigatório";
    }else{
      return "Nome muito curto";
    }
  }
  //email
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.contains("@");
  String get emailErro {
    if(email == null || emailValid){
      return null;
    }else if(email.contains(".com")){
      return "E-mail inválido";
    }else{
      return "Campo obrigatório";
    }
  }

  @observable
  String phone;

  @action
  void setPhone (String value)=> phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >=14;
  String get phoneError{
    if(phone == null || phoneValid){
      return null;
    }else if(phone.isEmpty){
      return "Campo obrigatório";
    }else{
      return "Celular inválido";
    }
  }

  //senha
  @observable
  String pass1;

  @action
  void setPass1(String value) => pass1 = value;

  @computed
  bool get pass1Valid => pass1 != null && pass1.length >=6;
  String get pass1Error{
    if(pass1 == null || pass1Valid){
      return null;
    }else if(pass1.isEmpty){
      return "Campo vazio";
    }else{
      return "Senha muito curta";
    }
  }

  @observable
  String pass2;
  @action
  void setPass2(String value)=> pass2 = value;
  @computed
  bool get pass2Valid => pass2 != null && pass2 == pass1;
  String get pass2Error{
    if(pass2==null || pass1Valid){
      return null;
    }else if(pass2.length > pass1.length || pass2Valid==false){
      return "Senhas não coicidem";
    }
  }

  @computed
  bool get isValidForm => namedValid && emailValid && phoneValid && pass1Valid && pass2Valid;

  @observable
  bool loading=false;
  //@action
  //void setLoading(bool value)=> loading=value;
  @action
  Future<void> _signUp()async{
    //setLoading(true);
    loading = true;
    await Future.delayed(Duration(seconds: 3));
    //setLoading(false);
    loading=false;
  }

  @computed
  Function get signUpPressed => (isValidForm && !loading) ? _signUp : null;



}