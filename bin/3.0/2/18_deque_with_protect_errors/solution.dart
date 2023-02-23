import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/18/

void main() {
  List<String> lines = File('bin/3.0/2/18_deque_with_protect_errors/input.txt')
      .readAsLinesSync();
  List<int> deque = [];
  for (var line in lines) {
    List<String> input = line.split(' ');
    if (input[0] == 'push_front') {
      deque.insert(0, int.parse(input[1]));
      print('ok');
    } else if (input[0] == 'push_back') {
      deque.add(int.parse(input[1]));
      print('ok');
    } else if (input[0] == 'pop_front') {
      if (deque.isEmpty) {
        print('error');
      } else {
        print(deque[0]);
        deque.removeAt(0);
      }
    } else if (input[0] == 'pop_back') {
      if (deque.isEmpty) {
        print('error');
      } else {
        print(deque.last);
        deque.removeLast();
      }
    } else if (input[0] == 'front') {
      if (deque.isEmpty) {
        print('error');
      } else {
        print(deque[0]);
      }
    } else if (input[0] == 'back') {
      if (deque.isEmpty) {
        print('error');
      } else {
        print(deque.last);
      }
    } else if (input[0] == 'size') {
      print(deque.length);
    } else if (input[0] == 'clear') {
      deque.clear();
      print('ok');
    } else if (input[0] == 'exit') {
      print('bye');
      break;
    }
  }
}
