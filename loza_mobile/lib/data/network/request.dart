class LoginRequest {
  String email;
  String password;

  LoginRequest(this.email, this.password);
}

class RegisterRequest {
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNumber;
  String address;
  String dateOfBirth;

  RegisterRequest(this.firstName, this.lastName, this.email, this.password, this.phoneNumber, this.address,this.dateOfBirth);
}