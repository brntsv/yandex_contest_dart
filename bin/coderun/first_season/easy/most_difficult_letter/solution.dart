import 'dart:io';
import 'dart:math';

void main() {
  List<String> lines =
      File('bin/coderun/easy/most_difficult_letter/input.txt').readAsLinesSync();
  int n = int.parse(lines[0]);
  String str = lines[1];
  List<int> millisec = lines[2].split(' ').map((e) => int.parse(e)).toList();
  List<int> prefix = List.generate(n, (index) => 0);
  prefix[0] = millisec[0];
  for (int i = 1; n > i; i++) {
    prefix[i] = millisec[i] - millisec[i - 1];
  }
  int maxMs = prefix.reduce(max);
  print(str[prefix.lastIndexOf(maxMs)]);
}
