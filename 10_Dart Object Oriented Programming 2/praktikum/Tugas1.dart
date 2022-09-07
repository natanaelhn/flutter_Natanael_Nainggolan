import 'test11.1.dart';
import 'test11.2.dart';
import 'test11.3.dart';

void main(List<String> args) {
  
  BangunRuang bangungRuang = BangunRuang(1, 2, 3);
  print(bangungRuang.volume());

  Kubus kubus = Kubus(7);
  print(kubus.volume());

  Balok balok = Balok(4, 5, 6);
  print(balok.volume());



}