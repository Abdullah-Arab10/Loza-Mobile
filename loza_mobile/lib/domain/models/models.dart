// login models

class Data{
  String token;

  Data(this.token);
}

class Error{
  String message;

  Error(this.message);
}

class Authentication{
  int statusCode;
  bool isError;
  Data? data;
  Error? error;
  String totalCount;

  Authentication(this.statusCode,this.isError,this.data,this.error,this.totalCount);
}