import 'dart:io';

void main() {
  List<String> lines =
      File('bin/coderun/easy/simple_hint/input.txt').readAsLinesSync();
  int n = int.parse(lines[0]);
  Map<String, int> hash = {};
  for (int i = 1; n >= i; i++) {
    hash.update(lines[i][0], (value) => value + 1, ifAbsent: () => 1);
  }
  int maxValue = 0;
  String maxKey = '';
  hash.forEach((k, v) {
    if (v > maxValue) {
      maxValue = v;
      maxKey = k;
    }
  });
  print(maxKey);
}
