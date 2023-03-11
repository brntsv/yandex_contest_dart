import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/45468/problems/27/

void main() {
  List<String> lines =
      File('bin/3.0/4/27_max_cost_path/input.txt').readAsLinesSync();
  List<int> sizes = lines[0].split(' ').map((e) => int.parse(e)).toList();
  int n = sizes[0];
  int m = sizes[1];
  List<List<int>> payments = [List.generate(m + 1, (int i) => 0)];
  for (int i = 1; n + 1 > i; i++) {
    payments.add([0]);
    payments[i].addAll(lines[i].split(' ').map((e) => int.parse(e)).toList());
  }
  List<List<int>> dp =
      List.generate(n + 1, (int a) => List.generate(m + 1, (int b) => -1));
  for (int i = 1; n + 1 > i; i++) {
    for (int j = 1; m + 1 > j; j++) {
      dp[i][j] = [dp[i - 1][j], dp[i][j - 1], 0].reduce(max) + payments[i][j];
    }
  }
  List<String> path = [];
  int i = n;
  int j = m;
  while (i > 1 || j > 1) {
    if (dp[i][j] == dp[i - 1][j] + payments[i][j]) {
      path.add('D');
      i--;
    } else {
      path.add('R');
      j--;
    }
  }
  print(dp.last.last);
  print(path.reversed.join(' '));
}
