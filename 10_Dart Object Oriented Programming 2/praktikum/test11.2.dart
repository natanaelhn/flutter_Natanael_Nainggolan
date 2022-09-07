import 'test11.1.dart';

class Kubus extends BangunRuang{
  late int sisi;

  Kubus(int sisi) : super(sisi, sisi, sisi){
    this.sisi = sisi;
  }

  @override
  String volume() => "Volume kubus = ${panjang*lebar*tinggi}";

}