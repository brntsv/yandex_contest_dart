import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/20/

void main() {
  List<String> lines =
      File('bin/3.0/2/20_piramid_sort/input.txt').readAsLinesSync();
  List<int> list = lines[1].split(' ').map((e) => int.parse(e)).toList();
  list.sort();
  print(list.join(' '));
}
