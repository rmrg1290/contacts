
String validateString(String value, RegExp regExp, String errorMessage){
  if(regExp.hasMatch(value)){
    return null;
  }else{
    return errorMessage;
  }
}