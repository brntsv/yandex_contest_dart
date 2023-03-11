import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/45468/problems/30/

void main() {
  List<String> lines = File('bin/3.0/4/30_biggest_common_subsequence/input.txt')
      .readAsLinesSync();
  int n = int.parse(lines[0]);
  List<int> first = [];
  List<String> firStr = lines[1].split(' ');
  for (String item in firStr) {
    if (int.tryParse(item) != null) {
      first.add(int.parse(item));
    }
  }
  int m = int.parse(lines[2]);
  List<int> second = [];
  List<String> secStr = lines[3].split(' ');
  for (String item in secStr) {
    if (int.tryParse(item) != null) {
      second.add(int.parse(item));
    }
  }
  List<List<int>> dp =
      List.generate(n + 1, (int a) => List.generate(m + 1, (int b) => 0));
  for (int i = 1; n + 1 > i; i++) {
    for (int j = 1; m + 1 > j; j++) {
      if (first[i - 1] == second[j - 1]) {
        dp[i][j] = 1 + dp[i - 1][j - 1];
      } else {
        dp[i][j] = max(dp[i - 1][j], dp[i][j - 1]);
      }
    }
  }
  List<int> subsequence = [];
  int i = n;
  int j = m;
  while (i >= 1 && j >= 1) {
    int maxValue = max(dp[i - 1][j], dp[i][j - 1]);
    if (dp[i][j] == maxValue + 1) {
      subsequence.add(first[i - 1]);
      i--;
      j--;
    } else if (dp[i][j - 1] == maxValue) {
      j--;
    } else {
      i--;
    }
  }
  print(subsequence.reversed.join(' '));
}
