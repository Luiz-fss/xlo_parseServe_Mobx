
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx_parse_server/models/user.dart';
import 'package:xlo_mobx_parse_server/repositories/parse_error.dart';
import 'package:xlo_mobx_parse_server/repositories/table_keys.dart';

class UserRepository {

  Future signUp(User user)async{
    final parseUser = ParseUser(
      user.email,user.password,user.email
    );
    
    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);
    parseUser.set(keyUserType, user.type.index);

    final response = await parseUser.signUp();

    if(response.success){
      print(response.results);
      return mapParseToUser(response.result);
    }else{
      //pegar a resposta e converter para uma mensagem interna
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<User> loginWithEmail(String email, String password) async{
    final parseUser = new ParseUser(email,password,null);
    final response = await parseUser.login();

    if(response.success){
      return mapParseToUser(response.result);
    }else{
      //pegar a resposta e converter para uma mensagem interna
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }


  User mapParseToUser(ParseUser parseUser){
    return new User(
      name: parseUser.get(keyUserName),
      email: parseUser.get(keyUserEmail),
      phone: parseUser.get(keyUserPhone),
      id: parseUser.get(keyUserId),
      type: UserType.values[parseUser.get(keyUserType)],
      createdAt: parseUser.get(keyUserCreatedAt)
    );
  }
}