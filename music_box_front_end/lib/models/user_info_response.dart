class UserInfoResponse{
  int id;
  String userName;
  String jwtToken;
  List<String> roles;

  UserInfoResponse({
    required this.id,
    required this.userName,
    required this.jwtToken,
    required this.roles,
  });
}