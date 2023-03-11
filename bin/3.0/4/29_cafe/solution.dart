import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/45468/problems/29/

void main() {
  List<String> lines = File('bin/3.0/4/29_cafe/input.txt').readAsLinesSync();
  int n = int.parse(lines[0]);
  List<int> prices = [0];
  for (int i = 1; n >= i; i++) {
    prices.add(int.parse(lines[i]));
  }
  List<List<int>> dp =
      List.generate(n + 1, (int a) => List.generate(n + 3, (int b) => 10000));
  dp[0][1] = 0;
  for (int i = 1; n + 1 > i; i++) {
    for (int j = 1; n + 2 > j; j++) {
      if (prices[i] <= 100) {
        dp[i][j] = min(dp[i - 1][j + 1], dp[i - 1][j] + prices[i]);
      } else {
        dp[i][j] = min(dp[i - 1][j + 1], dp[i - 1][j - 1] + prices[i]);
      }
    }
  }
  int minValue = 10000;
  int minIndex = -1;
  for (int i = 1; n + 2 > i; i++) {
    if (minValue >= dp.last[i]) {
      minValue = dp.last[i];
      minIndex = i;
    }
  }
  List<int> ans = [];
  int j = minIndex;
  for (int i = n; i > 0; i--) {
    if (prices[i] <= 100) {
      if (dp[i][j] == dp[i - 1][j + 1]) {
        ans.add(i);
        j++;
      }
    } else if (dp[i][j] == dp[i - 1][j + 1]) {
      ans.add(i);
      j++;
    } else {
      j--;
    }
  }
  print(minValue);
  print('${minIndex - 1} ${ans.length}');
  print(ans.reversed.join(' '));
}
