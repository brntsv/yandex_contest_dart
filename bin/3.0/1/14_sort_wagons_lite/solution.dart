import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/14/

void main() {
  List<String> lines =
      File('bin/3.0/1/14_sort_wagons_lite/input.txt').readAsLinesSync();
  int n = int.parse(lines[0]);
  List<int> way1 = lines[1].split(' ').map((e) => int.parse(e)).toList();
  List<int> way2 = [];
  List<int> stack = [0];
  for (int wagon in way1) {
    if (wagon > stack.last) {
      while (stack.isNotEmpty && wagon > stack.last) {
        way2.add(stack.last);
        stack.removeLast();
      }
    }
    stack.add(wagon);
  }
  while (stack.isNotEmpty) {
    way2.add(stack.last);
    stack.removeLast();
  }
  way2.join() == List.generate(n + 1, (i) => i++).join()
      ? print('YES')
      : print('NO');
}
