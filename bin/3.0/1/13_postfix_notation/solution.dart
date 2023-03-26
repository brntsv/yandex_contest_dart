import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/13/

void main() {
  List<String> lines =
      File('bin/3.0/1/13_postfix_notation/input.txt').readAsLinesSync();
  List<String> input = lines[0].split(' ');
  List<int> stack = [];
  for (var item in input) {
    final parsed = int.tryParse(item);
    if (parsed != null) {
      stack.add(parsed);
    } else {
      int last1 = stack.removeLast();
      int last2 = stack.removeLast();
      if (item == '+') {
        stack.add(last2 + last1);
      } else if (item == '-') {
        stack.add(last2 - last1);
      } else if (item == '*') {
        stack.add(last2 * last1);
      }
    }
  }
  if (stack.isEmpty) {
    print(0);
  } else {
    print(stack[0]);
  }
}
