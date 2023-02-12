import 'dart:io';
// https://contest.yandex.ru/contest/27393/problems/C/

void main() {
  List<String> lines =
      File('bin/1.0/1/c_phone_numbers/input.txt').readAsLinesSync();
  var re = RegExp(r'^[+]?[7|8]?|[-()]');
  String myNum = lines[0].replaceAll(re, '');
  String num1 = lines[1].replaceAll(re, '');
  String num2 = lines[2].replaceAll(re, '');
  String num3 = lines[3].replaceAll(re, '');
  bool isMyNumber(String n) {
    if (n.length == 10) {
      return n == myNum;
    } else if (n.length == 7) {
      return n == myNum.substring(3);
    }
    return false;
  }

  print(isMyNumber(num1) ? 'YES' : 'NO');
  print(isMyNumber(num2) ? 'YES' : 'NO');
  print(isMyNumber(num3) ? 'YES' : 'NO');
}
