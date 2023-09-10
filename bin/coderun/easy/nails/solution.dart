import 'dart:io';
import 'dart:math';

void main() {
  List<String> lines = File('bin/coderun/easy/nails/input.txt').readAsLinesSync();
  int n = int.parse(lines[0]);
  List<String> input = lines[1].split(' ');
  List<int> nails = [];
  for (String nail in input) {
    if (int.tryParse(nail) != null) {
      nails.add(int.parse(nail));
    }
  }
  nails.sort();
  List<int> dp = [nails[1] - nails[0], nails[1] - nails[0]];
  for (int i = 2; n > i; i++) {
    dp.add(nails[i] - nails[i - 1] + min(dp[i - 1], dp[i - 2]));
  }
  print(dp[n - 1]);
}