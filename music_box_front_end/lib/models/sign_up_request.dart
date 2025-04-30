class SignUpRequest{
  String username;
  String email;
  String firstname;
  String lastname;
  String password;
  List<String> roles;

  SignUpRequest({
    required this.username,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.password,
    required this.roles,
  });
}