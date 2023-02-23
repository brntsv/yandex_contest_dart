import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/5/

void main() {
  List<String> lines =
      File('bin/3.0/warm_up/5_good_string/input.txt').readAsLinesSync();
  List<int> countL = [];
  for (int i = 1; lines.length > i; i++) {
    countL.add(int.parse(lines[i]));
  }
  isGoodString() {
    if (int.parse(lines[0]) == 1) {
      return 0;
    }
    List<int> result = [];
    for (int i = 1; countL.length > i; i++) {
      if (countL[i] >= countL[i - 1]) {
        result.add(countL[i - 1]);
      } else if (countL[i] < countL[i - 1]) {
        result.add(countL[i]);
      }
    }
    return result.reduce((a, b) => a + b);
  }

  print(isGoodString());
}
