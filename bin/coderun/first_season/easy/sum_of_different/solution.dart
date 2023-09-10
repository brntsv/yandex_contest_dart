import 'dart:io';

// ЗАЧТЕНО

void main() {
  List<String> lines = File('bin/coderun/easy/sum_of_different/input.txt').readAsLinesSync();
  Set<int> input = lines[1].split(' ').map((e) => int.parse(e)).toSet();
  print(input.reduce((a, b) => a + b));
}