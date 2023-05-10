bool isEmailValid(String email) {
  return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

final dPassValid = RegExp(r'\d');
final uPassValid = RegExp(r'[A-Z]');
final lPassValid = RegExp(r'[a-z]');

bool isDigitPasswordValid(String pass){
  if(dPassValid.hasMatch(pass)){
    return true;
  }else{
    return false;
  }
}

bool isUpperCasePasswordValid(String pass){
  if(uPassValid.hasMatch(pass)){
    return true;
  }else{
    return false;
  }
}

bool isLowerCasePasswordValid(String pass){
  if(lPassValid.hasMatch(pass)){
    return true;
  }else{
    return false;
  }
}
