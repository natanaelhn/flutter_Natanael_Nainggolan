import 'package:flutter/cupertino.dart';

class ContactUsFormProvider extends ChangeNotifier{

  bool usernameIsChanged = false;
  bool emailIsChanged = false;
  bool messageIsChanged = false;
  bool submitButtonEnabled = true;

  String? fieldIsEmpty({required bool isChanged, required String value}){
    if (value.isEmpty && isChanged){
      return 'Field can\'t be empty';
    }
    else{
      return null;
    }
  }

  void notifyListener(){
    notifyListeners();
  }
}