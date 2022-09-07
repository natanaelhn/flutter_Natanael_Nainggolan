class BangunRuang{
  late int panjang;
  late int lebar;
  late int tinggi;

  String volume() => "Volume bangung ruang = ${panjang*lebar*tinggi}";

  BangunRuang(int panjang, int lebar, int tinggi){
    this.panjang = panjang;
    this.lebar = lebar;
    this.tinggi = tinggi;
  }
}