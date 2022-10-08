class TagObject{

  final List<String> sfw;
  final List<String> nsfw;

  const TagObject({required this.sfw, required this.nsfw});

  factory TagObject.fromJSON(Map<String, dynamic> json){

    // for(var i in (json['sfw'] as List<dynamic>).cast<String>()){
    //   print(i);
    // }
    // print((json['sfw'] as List<dynamic>).cast<String>());

    return TagObject(
      sfw: (json['sfw'] as List<dynamic>).cast<String>(), 
      nsfw: (json['nsfw'] as List<dynamic>).cast<String>()
    );
  }
}

