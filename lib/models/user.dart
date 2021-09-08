
enum UserType{PARTICULAR,PROFESSIONAL}
class User{
  String name;
  String email;
  String phone;
  String password;
  UserType type;

  User({this.name, this.email, this.phone, this.password,this.type=UserType.PARTICULAR});
}