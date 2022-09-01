void main(List<String> args) {
  
  //Menyimpan nilai soal kedalam variabel dan mencetak output menggunakan for
  List<int> varList = [10,20,30];

  for(int i in varList){
    print("nilai faktorial dari $i adalah ${faktorial(i)}");
  }

}

//fungsi faktorial
double? faktorial(int nilaiInput){

  double value = 1;
  for(int i = 1; i <= nilaiInput; i++){
    value *= i;
  }
  return value;
}