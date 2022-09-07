import 'Tugas2.dart';
import 'test12.1.dart';

class KelipatanPersekutuanTerkecil implements Matematika{
  late int x;
  late int y;

  @override
  String hasil() => "Hasil KPK dari $x dan $y adalah ${cariKPK()}";

  //Method cari hasil KPK
  int cariKPK(){

    int tempKPK = 1;

    Map pohonFaktorX = pohonFaktor(x);
    Map pohonFaktorY = pohonFaktor(y);

    for(int i in pohonFaktorX.keys){
      if (pohonFaktorY.keys.contains(i)){

        int tempPangkat = 0;
        int temp = 1;
        if(pohonFaktorX[i] >= pohonFaktorY[i]){
          tempPangkat = pohonFaktorX[i];
        }
        else{
          tempPangkat = pohonFaktorY[i];
        }

        for(int j = 0; j < tempPangkat; j++){
          temp *= i;
        }
        tempKPK *= temp;
      }
      else{
        tempKPK *= i;
      }
    }
    for(int i in pohonFaktorY.keys){
      if (!pohonFaktorX.keys.contains(i)){
        tempKPK *= i;
      }
    }


    return tempKPK;
  }

  KelipatanPersekutuanTerkecil(int x, int y){
    this.x = x;
    this.y = y;
  }
}