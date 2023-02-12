import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/27393/problems/A/

void main() {
  List<String> lines =
      File('bin/1.0/1/a_conditioner/input.txt').readAsLinesSync();

  int troom = int.parse(lines[0].split(' ')[0]);
  int tcond = int.parse(lines[0].split(' ')[1]);
  String mode = lines[1];

  countTemperature(int troom, int tcond, String mode) {
    if (mode == 'fan') {
      return troom;
    } else if (mode == 'auto') {
      return tcond;
    } else if (mode == 'heat') {
      return max(troom, tcond);
    } else if (mode == 'freeze') {
      return min(troom, tcond);
    }
  }

  print(countTemperature(troom, tcond, mode));
}
