import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/13/

void main() {
  List<String> lines =
      File('bin/3.0/1/13_postfix_notation/input.txt').readAsLinesSync();
  List<String> input = lines[0].split(' ');
  List<dynamic> postfix = [];
  for (var item in input) {
    if (int.tryParse(item) != null) {
      postfix.add(int.parse(item));
    } else if (item != '') {
      postfix.add(item);
    }
  }
  List<int> stack = [];
  for (var item in postfix) {
    if (item is int) {
      stack.add(item);
    } else if (item == '+') {
      int last1 = stack.last;
      int last2 = stack[stack.length - 2];
      stack.removeLast();
      stack.removeLast();
      stack.add(last2 + last1);
    } else if (item == '-') {
      int last1 = stack.last;
      int last2 = stack[stack.length - 2];
      stack.removeLast();
      stack.removeLast();
      stack.add(last2 - last1);
    } else if (item == '*') {
      int last1 = stack.last;
      int last2 = stack[stack.length - 2];
      stack.removeLast();
      stack.removeLast();
      stack.add(last2 * last1);
    }
  }
  if (stack.isEmpty) {
    print(0);
  } else {
    print(stack[0]);
  }
}
