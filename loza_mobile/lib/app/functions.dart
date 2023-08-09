final dPassValid = RegExp(r'\d');
final sPassValid = RegExp(r'\W');
final uPassValid = RegExp(r'[A-Z]');
final lPassValid = RegExp(r'[a-z]');

bool isDigitPasswordValid(String pass){
  if(dPassValid.hasMatch(pass)){
    return true;
  }else{
    return false;
  }
}

bool isSymbolPasswordValid(String pass){
  if(sPassValid.hasMatch(pass)){
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
