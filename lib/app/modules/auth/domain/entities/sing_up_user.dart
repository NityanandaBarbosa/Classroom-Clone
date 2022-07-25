class SingUpUser {
  
  final String email;
  final String password;
  final String userFullName;

  SingUpUser({
      required this.email,
      required this.password,
      required this.userFullName
      });
}

class SingedUser extends SingUpUser{
  final int id;

  SingedUser({required this.id,required super.email, required super.password, required super.userFullName});
}
