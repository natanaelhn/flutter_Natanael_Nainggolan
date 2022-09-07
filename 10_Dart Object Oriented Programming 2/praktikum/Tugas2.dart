import 'test12.2.dart';
import 'test12.3.dart';

void main() {
  
  KelipatanPersekutuanTerkecil kpk = KelipatanPersekutuanTerkecil(48, 66);
  print(kpk.hasil());

  FaktorPersekutuanTerbesar fpb = FaktorPersekutuanTerbesar(48, 66);
  print(fpb.hasil());
}

bool isPrimeNumber(int number){

  for (int i = 2; i <= number/3; i++){
    if (number%i == 0){
      return false;
    }
  }

  return true;
}

//Return {angka : pangkat}
Map pohonFaktor(int number){

  Map tempMap = {};

  while(!isPrimeNumber(number)){
    
    for(int i = 2; i <= number/3; i++){
      if(number % i == 0 && isPrimeNumber(i)){
        if(tempMap.containsKey(i)){
          tempMap[i] += 1;
        }
        else{
          tempMap[i] = 1;
        }
        number = (number / i).toInt();
        break;
      }
    }
  }

  if(tempMap.containsKey(number)){
    tempMap[number] += 1;
  }
  else{
    tempMap[number] = 1;
  }

  return tempMap;
}