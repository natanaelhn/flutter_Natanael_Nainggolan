void main() {
  
  List myList = [["name", "Natanael"], ["age", 22], ["sex", "male"]];
  print("List sebelum diolah = $myList");

  print("Map setelah diolah = ${buatMap(myList)}");
}

Map buatMap(List varList){

  Map myMap = {};

  for(List i in varList){
    myMap[i[0]] = i[1];
  }

  return myMap;
}