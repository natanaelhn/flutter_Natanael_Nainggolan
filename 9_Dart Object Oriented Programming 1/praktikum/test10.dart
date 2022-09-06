import 'test10.1.dart';
import 'test10.2.dart';

void main(List<String> args) {
  Hewan hewanA = Hewan(3);
  Hewan hewanB = Hewan(2);
  Mobil mobil = Mobil(4);

  mobil.tambahMuatan(hewanA);
  mobil.tambahMuatan(hewanB);
}