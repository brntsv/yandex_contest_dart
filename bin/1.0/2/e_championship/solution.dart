import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/27472/problems/E/

void main() {
  List<String> lines =
      File('bin/1.0/2/e_championship/input.txt').readAsLinesSync();
  List<int> input = lines[1].split(' ').map((e) => int.parse(e)).toList();

  maxPlace(List<int> input) {
    int maxPlace = input.reduce(max);
    int targetScore = 0;
    for (int i = 0; input.length - 1 > i; i++) {
      if (input[i] == maxPlace &&
          input[i + 1].toString().split('').last == '5' &&
          input[i + 2] < input[i + 1]) {
        targetScore = input[i + 1];
        return input.indexOf(targetScore) + 1;
      }
    }
    return targetScore;
  }

  print(maxPlace(input));
}
