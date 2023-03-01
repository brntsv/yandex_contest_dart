import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/45468/problems/23/

// O(N) - сложность

void main() {
  List<String> lines =
      File('bin/3.0/3/23_calculator/input.txt').readAsLinesSync();
  int n = int.parse(lines[0]);
  List<int> dp = [0, 0, 1, 1, 2];
  for (int i = 5; n + 1 > i; i++) {
    if (i % 6 == 0) {
      dp.add([dp[i ~/ 2] + 1, dp[i ~/ 3] + 1, dp[i - 1] + 1].reduce(min));
    } else if (i % 3 == 0) {
      dp.add([dp[i ~/ 3] + 1, dp[i - 1] + 1].reduce(min));
    } else if (i % 2 == 0) {
      dp.add([dp[i ~/ 2] + 1, dp[i - 1] + 1].reduce(min));
    } else {
      dp.add(dp[i - 1] + 1);
    }
  }
  List<int> sequence = [n];
  while (n != 1) {
    if (n % 6 == 0) {
      int minTemp = [dp[n ~/ 2] + 1, dp[n ~/ 3] + 1, dp[n - 1] + 1].reduce(min);
      if (minTemp == dp[n ~/ 2] + 1) {
        n = n ~/ 2;
        sequence.add(n);
      } else if (minTemp == dp[n ~/ 3] + 1) {
        n = n ~/ 3;
        sequence.add(n);
      } else if (minTemp == dp[n - 1] + 1) {
        n -= 1;
        sequence.add(n);
      }
    } else if (n % 3 == 0) {
      int minTemp = min(dp[n ~/ 3] + 1, dp[n - 1] + 1);
      if (minTemp == dp[n ~/ 3] + 1) {
        n = n ~/ 3;
        sequence.add(n);
      } else if (minTemp == dp[n - 1] + 1) {
        n -= 1;
        sequence.add(n);
      }
    } else if (n % 2 == 0) {
      int minTemp = min(dp[n ~/ 2] + 1, dp[n - 1] + 1);
      if (minTemp == dp[n ~/ 2] + 1) {
        n = n ~/ 2;
        sequence.add(n);
      } else if (minTemp == dp[n - 1] + 1) {
        n -= 1;
        sequence.add(n);
      }
    } else {
      n -= 1;
      sequence.add(n);
    }
  }
  sequence.sort();
  print(sequence.length - 1);
  print(sequence.join(' '));
}
