import 'dart:io';
/* https://contest.yandex.ru/contest/45468/problems/21/

Tribonacci
0, 1 = 2
00, 01, 10, 11 = 4
000, 001, 010, 011, 100, 101, 110 = 7
0000, 0001, 0010, 0011, 0100, 0101, 0110, 1000, 1001, 1010, 1011, 1100, 1101 = 13
*/

void main() {
  List<String> lines =
      File('bin/3.0/3/21_three_in_row/input.txt').readAsLinesSync();
  int n = int.parse(lines[0]);
  List<int> dp = [2, 4, 7, 13];
  for (int i = 4; n > i; i++) {
    dp.add(dp[i - 1] + dp[i - 2] + dp[i - 3]);
  }
  print(dp[n - 1]);
}

// Вариант 2
// dp.add(2 * dp[i - 1] - dp[i - 4]);