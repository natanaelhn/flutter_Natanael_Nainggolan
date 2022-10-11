class LoginObject{

  LoginObject({required this.error, required this.message, this.loginResult});

  final bool error;
  final String message;
  final Map<String, String>? loginResult;

  factory LoginObject.fromJSON(Map<String, dynamic> json){

    return LoginObject(
      error: json['error'], 
      message: json['message'], 
      loginResult: (json['loginResult'] != null) ? 
        (json['loginResult'] as Map<String, dynamic>).cast<String, String>() : null,
    );

  }

}