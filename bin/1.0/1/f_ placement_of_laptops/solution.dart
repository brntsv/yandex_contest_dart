import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/27393/problems/F/

void main() {
  List<String> lines =
      File('bin/1.0/1/f_ placement_of_laptops/input.txt').readAsLinesSync();

  List<String> input = lines[0].split(' ');
  List<int> inputToInt = input.map((e) => int.parse(e)).toList();

  int min1 = min(inputToInt[0], inputToInt[1]);
  int max1 = max(inputToInt[0], inputToInt[1]);

  int min2 = min(inputToInt[2], inputToInt[3]);
  int max2 = max(inputToInt[2], inputToInt[3]);

  int squareFromMins = (min1 + min2) * max(max1, max2);
  int squareFromMaxAndMin = 0;

  if (max1 > max2) {
    squareFromMaxAndMin = (max1 + min2) * max(min1, max2);
  } else {
    squareFromMaxAndMin = (max2 + min1) * max(min2, max1);
  }
  if (squareFromMins < squareFromMaxAndMin) {
    print([min1 + min2, max(max1, max2)]);
  } else if (max1 > max2) {
    print([max1 + min2, max(min1, max2)]);
  } else {
    print([max2 + min1, max(min2, max1)]);
  }
}
