import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/28/

void main() {
  List<String> lines =
      File('bin/3.0/4/28_knight_move/input.txt').readAsLinesSync();
  List<int> sizes = lines[0].split(' ').map((e) => int.parse(e)).toList();
  int n = sizes[0];
  int m = sizes[1];
  List<List<int>> dp =
      List.generate(n, (int a) => List.generate(m, (int b) => 0));

  dp[0][0] = 1;

  for (int i = 0; n > i; i++) {
    for (int j = 0; m > j; j++) {
      if (i - 2 >= 0 && j - 1 >= 0) {
        dp[i][j] += dp[i - 2][j - 1];
      }
      if (i - 1 >= 0 && j - 2 >= 0) {
        dp[i][j] += dp[i - 1][j - 2];
      }
    }
  }
  print(dp.last.last);
}
