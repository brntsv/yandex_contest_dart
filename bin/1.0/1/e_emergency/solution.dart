import 'dart:io';
// https://contest.yandex.ru/contest/27393/problems/E/

void main() {
  List<String> lines =
      File('bin/1.0/1/e_emergency/input.txt').readAsLinesSync();
  List<String> input = lines[0].split(' ');
  List<int> inputToInt = input.map((e) => int.parse(e)).toList();
}
