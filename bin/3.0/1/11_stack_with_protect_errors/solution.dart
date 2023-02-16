import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/11/

void main() {
  List<String> lines = File('bin/3.0/1/11_stack_with_protect_errors/input.txt')
      .readAsLinesSync();
  List<int> stack = [];
  for (var line in lines) {
    List<String> input = line.split(' ');
    if (input[0] == 'push') {
      stack.add(int.parse(input[1]));
      print('ok');
    } else if (input[0] == 'pop') {
      if (stack.isEmpty) {
        print('error');
      } else {
        print(stack.last);
        stack.removeLast();
      }
    } else if (input[0] == 'back') {
      if (stack.isEmpty) {
        print('error');
      } else {
        print(stack.last);
      }
    } else if (input[0] == 'size') {
      print(stack.length);
    } else if (input[0] == 'clear') {
      stack.clear();
      print('ok');
    } else if (input[0] == 'exit') {
      print('bye');
      break;
    }
  }
}
