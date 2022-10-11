class RegisterObject{

  RegisterObject({required this.error, required this.message});

  final bool error;
  final String message;

  factory RegisterObject.fromJSON(Map<String, dynamic> json){

    return RegisterObject(
      error: json['error'], 
      message: json['message'], 
    );

  }

}