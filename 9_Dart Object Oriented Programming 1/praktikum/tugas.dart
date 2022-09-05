void main(List<String> args) {
  Hewan hewanA = Hewan(3);
  Hewan hewanB = Hewan(2);
  Mobil mobil = Mobil(4);

  mobil.tambahMuatan(hewanA);
  mobil.tambahMuatan(hewanB);
}

//Kelas Hewan dengan Property berat
class Hewan{
  //Property berat
  late int berat;
  
  Hewan(int berat){
    this.berat = berat;
  }
  
}

//Kelas Mobil dengan Property kapasitas, muatan
//Kelas Mobil dengan Method tambahMuatan dan totalMuatan
class Mobil{
  //Property kapasitas dan muatan
  late int kapasitas;
  late List<Hewan> muatan;

  //Method tambahMuatan dan totalMuatan
  void tambahMuatan(Hewan calonHewanMasuk){
    
    //Cara kerja yaitu menghitung totalMuatan yang terpakai
    //Lalu cari sisaMuatan dengan rumus kapasitas - totalMuatan
    //Jika berat hewan yang akan masuk lebih kecil sama dengan sisaMuatan
    //Maka muatan ditambahkan, jika tidak mencetak "Tidak muat"
    int beratMuatan = totalMuatan();
    int sisaMuatan = kapasitas - beratMuatan;

    if(calonHewanMasuk.berat <= sisaMuatan){
      muatan.add(calonHewanMasuk);
      print("Hewan sudah masuk");
    }
    else{
      print("Tidak muat");
    }
  }

  int totalMuatan(){

    //Cara kerja yaitu menambahkan masing masing berat hewan kedalam satu variabel
    //Variabel yang menambung totalMuatan dimulai dari angka 0
    int beratMuatan = 0;
    for(Hewan i in muatan){
      beratMuatan += i.berat;
    }
    return beratMuatan;
  }

  Mobil(int kapasitas){
    this.kapasitas = kapasitas;
    muatan = [];
  }
}