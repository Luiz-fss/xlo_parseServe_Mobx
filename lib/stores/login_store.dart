import 'package:mobx/mobx.dart';
import 'package:xlo_mobx_parse_server/helpers/extensions.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError =>
      emailValid == null || emailValid ? null : "E-mail inválido";

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passowordValid => password != null && password.length >= 4;
  String get passwordError =>
      passowordValid == null|| passowordValid ? null : "Senha inválida";

  @computed
  Function get loginPresed => emailValid && passowordValid && !loading ? _loginIn : null;

  @observable
  bool loading = false;

  @action
  Future<void> _loginIn () async{
    loading = true;
    await Future.delayed(Duration(seconds: 3));
    loading = false;
  }
}