import 'Tugas2.dart';
import 'test12.1.dart';

class FaktorPersekutuanTerbesar implements Matematika{
  late int x;
  late int y;

  @override
  String hasil() => "Hasil FPB dari $x dan $y adalah ${cariFPB()}";

  //Method cari hasil FPB
  int cariFPB(){
    
    int tempFPB = 1;

    Map pohonFaktorX = pohonFaktor(x);
    Map pohonFaktorY = pohonFaktor(y);

    for (int i in pohonFaktorX.keys){
      if (pohonFaktorY.keys.contains(i)){

        int tempPangkat = 0;
        int temp = 1;
        if(pohonFaktorX[i] <= pohonFaktorY[i]){
          tempPangkat = pohonFaktorX[i];
        }
        else{
          tempPangkat = pohonFaktorY[i];
        }

        for(int j = 0; j < tempPangkat; j++){
          temp *= i;
        }
        tempFPB *= temp;

      }
    }

    return tempFPB;
  }

  FaktorPersekutuanTerbesar(int x, int y){
    this.x = x;
    this.y = y;
  }
}