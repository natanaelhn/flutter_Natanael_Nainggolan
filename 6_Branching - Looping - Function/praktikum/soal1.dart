void main(List<String> args) {
  
  //Menyimpan nilai soal kedalam variabel dan mencetak output menggunakan for
  List<int> input = [100, 80, 60, 40, 20, 0];
  
  for(int i in input){
    print("$i = ${fungsi(i)}");
  }

}

String fungsi(int nilaiInput){

  //Membuat map sebagai variabel yang wadah menyimpan nilai kondisi dan nilai return
  Map<int, String> varMap = {
    70 : "A",
    40 : "B",
    0 : "C"
  };

  //Mencari nilai return yang tepat untuk kondisi yang dipenuhi
  for(int i = 0; i < varMap.length; i++){
    if(nilaiInput > varMap.keys.elementAt(i)){
      return (varMap.values.elementAt(i));
    }
  }

  //Return teks kosong ketika semua kondisi tidak terpenuhi 
  return ("");
}