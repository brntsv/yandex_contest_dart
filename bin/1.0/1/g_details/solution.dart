import 'dart:io';
// https://contest.yandex.ru/contest/27393/problems/G/

/*
composit - сплав
blank - заготовка
detail - деталь
*/

void main() {
  List<String> lines = File('bin/1.0/1/g_details/input.txt').readAsLinesSync();
  List<String> input = lines[0].split(' ');
  List<int> inputToInt = input.map((e) => int.parse(e)).toList();

  countDetails(int composit, int blank, int detail) {
    if (composit == 0 || blank == 0 || detail == 0) {
      return 0;
    } else if (detail > blank || blank > composit) {
      return 0;
    }
    int nBlanks = composit ~/ blank;
    int compositRemainder = composit % blank;
    int nDetails = (blank ~/ detail) * nBlanks;
    int blankRemainder = (blank % detail) * nBlanks;
    compositRemainder = compositRemainder + blankRemainder;
    if (compositRemainder >= blank) {
      return nDetails + countDetails(compositRemainder, blank, detail);
    } else {
      return nDetails;
    }
  }

  print(countDetails(inputToInt[0], inputToInt[1], inputToInt[2]));
}
