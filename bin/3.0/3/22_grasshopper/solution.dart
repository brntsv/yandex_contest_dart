import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/45468/problems/22/

void main() {
  List<String> lines =
      File('bin/3.0/3/22_grasshopper/input.txt').readAsLinesSync();
  List<int> input = lines[0].split(' ').map((e) => int.parse(e)).toList();
  int n = input[0];
  int k = input[1];
  if (k >= n) {
    k = n - 1;
  }
  List<int> dp = List.filled(n + 1, 0);
  for (int i = 1; k + 1 > i; i++) {
    dp[i] = pow(2, i - 1).toInt();
  }
  dp[k + 1] = (pow(2, k) - 1).toInt();
  for (int i = k + 2; n + 1 > i; i++) {
    dp[i] = 2 * dp[i - 1] - dp[i - k - 1];
  }
  if (n == 1) {
    print(1);
  } else {
    print(dp[n - 1]);
  }
}




  // List<int> dp = List.filled(n + k, 0);
  // dp[k] = 1;
  // print(dp);
  // for (int i = k; n + k > i; i++) {
  //   for (int j = i - 1; i - k - 1 > j; j--) {
  //     dp[i] += dp[j];
  //   }
  // }
  // print(dp[n + k - 1]);




  // List<int> dp = List.filled(n + 1, 0);
  // for (int i = 1; k + 1 > i; i++) {
  //   dp[i] = pow(2, i - 1).toInt();
  // }
  // dp[k + 1] = pow(2, k - 1).toInt();

  // for (int i = k + 2; n + 1 > i; i++) {
  //   dp[i] = 2 * dp[i - 1] - dp[i - k - 1];
  //   print(dp[i]);
  // }
  // print(dp[n]);