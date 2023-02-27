import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/45468/problems/22/

/*
Step: if location is >> k then we can get there by ans(N-1) + ans(N-2) + ... + ans(N-k) as we can make a jump from
distance up to k from N. Take ans(N) - ans(N-1) = (ans(N-1) + ans(N-2) + ... + ans(N-k)) - 
(ans(N-2) + ans(N-3) + ... + ans(N-k-1)) = ans(N-1) - ans(N-k-1) => ans(N) = 2*ans(N-1) - ans(N-k-1)
Base: should calculate base for up to k cells, construct several elements to see a pattern
1 - 1 #1
2 - 11 2 #2
3 - 111 21 12 3 #4
4 - 1111 211 121 112 22 31 13 4 #8
5 - 11111 2111 1211 1121 1112 221 212 122 311 131 113 32 23 41 14 5 #16
seems as if 2^(N-1)
*/

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
