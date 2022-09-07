import 'test11.1.dart';

class Balok extends BangunRuang{
  
  Balok(int panjang, int lebar, int tinggi) : super(panjang, lebar, tinggi);

  @override
  String volume() => "Volume balok = ${panjang*lebar*tinggi}";
}