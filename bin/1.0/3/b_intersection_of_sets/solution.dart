import 'dart:io';
// https://contest.yandex.ru/contest/27663/problems/B/

void main() {
  List<String> lines =
      File('bin/1.0/3/b_intersection_of_sets/input.txt').readAsLinesSync();
  Set<int> inputFirst = lines[0].split(' ').map((e) => int.parse(e)).toSet();
  Set<int> inputSecond = lines[1].split(' ').map((e) => int.parse(e)).toSet();

  intersection(Set<int> inputFirst, Set<int> inputSecond) {
    inputFirst.retainAll(inputSecond);
    List<int> result = inputFirst.toList()..sort();
    return result.join(' ');
  }

  print(intersection(inputFirst, inputSecond));
}
