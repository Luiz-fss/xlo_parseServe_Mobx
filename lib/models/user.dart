enum UserType { PARTICULAR, PROFESSIONAL }

class User {
  String id;
  String name;
  String email;
  String phone;
  String password;
  UserType type;
  DateTime createdAt;

  User(
      {this.name,
      this.email,
      this.id,
      this.phone,
      this.password,
      this.type = UserType.PARTICULAR,
      this.createdAt});

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, phone: $phone, password: $password, type: $type, createdAt: $createdAt}';
  }

//gerar o toString

}
