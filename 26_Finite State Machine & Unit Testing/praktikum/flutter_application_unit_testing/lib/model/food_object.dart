class FoodObject{

  FoodObject({required this.id, required this.name});

  final int id;
  final String name;

  factory FoodObject.fromJSON(Map<String, dynamic> json){

    return FoodObject(
      id: json['id'], 
      name: json['name'],
    );
  }

}