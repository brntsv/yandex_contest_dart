import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/45468/problems/26/

void main() {
  List<String> lines =
      File('bin/3.0/4/26_cheapiest_path/input.txt').readAsLinesSync();
  List<int> sizes = lines[0].split(' ').map((e) => int.parse(e)).toList();
  int n = sizes[0];
  int m = sizes[1];
  List<List<int>> matrix = [];
  for (int i = 1; n >= i; i++) {
    matrix.add(lines[i].split(' ').map((e) => int.parse(e)).toList());
  }

  List<List<int>> dp = List.generate(n + 1, (int index) => [1000]);
  dp[0] = List.filled(m + 1, 1000);
  dp[0][1] = 0;
  dp[1][0] = 0;
  for (int i = 1; n + 1 > i; i++) {
    for (int j = 1; m + 1 > j; j++) {
      dp[i].add(matrix[i - 1][j - 1] + min(dp[i - 1][j], dp[i][j - 1]));
    }
  }
  print(dp.last.last);
}
