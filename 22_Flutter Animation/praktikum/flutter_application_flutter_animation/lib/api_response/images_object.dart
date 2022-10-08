class ImageObject{

  final List<String> files;

  const ImageObject({required this.files});

  factory ImageObject.fromJSON(Map<String, dynamic> json){
    return ImageObject(
      files: (json['files'] as List<dynamic>).cast<String>(),
    );
  }
}