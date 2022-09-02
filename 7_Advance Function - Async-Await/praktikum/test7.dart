void main() async{
  List myList = [1,2,3,4];
  print("List = $myList");

  print("List setelah dikalikan oleh 2 = ${await perkalian(myList, 2)}");
}

Future<List> perkalian(List varList, int pengali) async{
  
  await Future.delayed(
    Duration(seconds: 1),
    (){
      for(int i = 0; i < varList.length; i++){
        varList[i] *= pengali;
      }
    }
  );

  return varList;
}