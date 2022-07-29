class SingUpParams {
  
  final String email;
  final String password;
  final String name;

  SingUpParams({
      required this.email,
      required this.password,
      required this.name
      });
}

class SingedUser extends SingUpParams{
  final int id;

  SingedUser({required this.id,required super.email, required super.password, required super.name});
}
