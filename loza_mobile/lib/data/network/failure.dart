class Failure {
  int statusCode; // 200, 201, 400, 303..500 and so on
  String message; // error , success

  Failure(this.statusCode, this.message);
}
