class ArtistSendingDto {
  String email = "";
  String userName = "";
  String firstName = "";
  String lastName = "";
  String password = "";

  void setEmail(String email){
    this.email = email;
  }

  void setUserName(String userName){
    this.userName = userName;
  }

  void setPassword(String password){
    this.password = password;
  }

  void setFirstName(String firstName){
    this.firstName = firstName;
  }

  void setLastName(String lastName){
    this.lastName = lastName;
  }
}