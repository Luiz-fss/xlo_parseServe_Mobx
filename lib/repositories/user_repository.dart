
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx_parse_server/models/user.dart';
import 'package:xlo_mobx_parse_server/repositories/parse_error.dart';
import 'package:xlo_mobx_parse_server/repositories/table_keys.dart';

class userRepository {

  Future<void> signUp(User user)async{
    final parseUser = ParseUser(
      user.email,user.password,user.email
    );
    
    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);
    parseUser.set(keyUserType, user.type.index);

    final response = await parseUser.signUp();

    if(response.success){

    }else{
      //pegar a resposta
      return Future.error(ParseErrors.getDescription(response.error.code));
    }


  }

}