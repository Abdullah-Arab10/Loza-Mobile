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

class AddAddressRequest {
  int userId;
  String addressName;
  String location;

  AddAddressRequest(this.userId, this.addressName,this.location);
}

class AddOrderRequest {
  int userid;
  int paymentmethod;
  int addressid;
  double total;

  AddOrderRequest(this.userid, this.paymentmethod, this.addressid, this.total);
}

class AddRatingRequest {
  int userid;
  int productId;
  double rating;
  String reviews;

  AddRatingRequest(this.userid, this.productId, this.rating, this.reviews);
}