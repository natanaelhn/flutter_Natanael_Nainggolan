import 'package:flutter/widgets.dart';

class LoginProvider with ChangeNotifier{

  bool _isLogin = true;

  bool get isLogin => _isLogin;

  void changeIsLogin(){
    _isLogin = !_isLogin;
    notifyListeners();
  }



  bool _isVisible = false;

  bool get isVisible => _isVisible;

  void changeIsVisible(){
    _isVisible = !_isVisible;
    notifyListeners();
  }



  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void changeIsLoading(bool? valueIsLoading){
    if(valueIsLoading != null){
      _isLoading = valueIsLoading;
    }
    else{
      _isLoading = !_isLoading;
    }
    notifyListeners();
  }
}