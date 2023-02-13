import 'dart:io';
// https://contest.yandex.ru/contest/27663/problems/

void main() {
  List<String> lines = File('bin/1.0/3/a_number_of_different_numbers/input.txt')
      .readAsLinesSync();
  List<int> input = lines[0].split(' ').map((e) => int.parse(e)).toList();
  print(input.toSet().length);
}
