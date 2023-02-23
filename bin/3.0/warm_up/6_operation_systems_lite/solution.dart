import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/6/

void main() {
  List<String> lines =
      File('bin/3.0/warm_up/6_operation_systems_lite/input.txt')
          .readAsLinesSync();
  int n = int.parse(lines[1]);
  List<List<int>> systems = [];
  for (int i = 2; n + 2 > i; i++) {
    systems.add(lines[i].split(' ').map((e) => int.parse(e)).toList());
  }
  Set<List<int>> setOfDelete = {};
  for (int i = 1; n > i; i++) {
    List<List<int>> prevs = systems.sublist(0, i);
    for (var item in prevs) {
      int start = systems[i][0];
      int end = systems[i][1];
      int startPrev = item[0];
      int endPrev = item[1];
      if ((start <= endPrev) && (startPrev <= end)) {
        setOfDelete.add(item);
      }
    }
  }
  Set<List<int>> systemsSet = Set.from(systems);
  print(systemsSet.difference(setOfDelete).length);
}
