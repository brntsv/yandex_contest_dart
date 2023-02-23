import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/16/

void main() {
  List<String> lines =
      File('bin/3.0/2/16_error_proof_queue/input.txt').readAsLinesSync();
  List<int> queue = [];
  int head = 0;
  for (var line in lines) {
    List<String> input = line.split(' ');
    if (input[0] == 'push') {
      queue.add(int.parse(input[1]));
      print('ok');
    } else if (input[0] == 'pop') {
      if (queue.sublist(head).isEmpty) {
        print('error');
      } else {
        print(queue[head]);
        head++;
      }
    } else if (input[0] == 'front') {
      if (queue.sublist(head).isEmpty) {
        print('error');
      } else {
        print(queue[head]);
      }
    } else if (input[0] == 'size') {
      print(queue.sublist(head).length);
    } else if (input[0] == 'clear') {
      queue.removeRange(head, queue.length);
      print('ok');
    } else if (input[0] == 'exit') {
      print('bye');
      break;
    }
  }
}
