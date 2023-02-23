import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/19/

void main() {
  List<String> lines = File('bin/3.0/1/19_heepui/input.txt').readAsLinesSync();
  List<int> queue = [];

  for (int i = 1; lines.length > i; i++) {
    List<String> input = lines[i].split(' ');
    if (input[0] == '0') {
      queue.add(int.parse(input[1]));
      int pos = queue.length - 1;
      while (pos > 0 && queue[pos] < queue[(pos - 1) ~/ 2]) {
        int x = queue[pos];
        queue[pos] = queue[(pos - 1) ~/ 2];
        queue[(pos - 1) ~/ 2] = x;
        pos = (pos - 1) ~/ 2;
      }
    } else if (input[0] == '1') {
      if (queue.length > 2) {
        int ans = queue.last;
        int first = queue[0];
        queue[0] = queue.last;
        int pos = 0;
        while (pos * 2 + 2 < queue.length) {
          int minSonIndex = pos * 2 + 1;
          if (queue[pos * 2 + 2] < queue[minSonIndex]) {
            minSonIndex = pos * 2 + 2;
          } else if (queue[pos] > queue[minSonIndex]) {
            int x = queue[pos];
            queue[pos] = queue[minSonIndex];
            queue[minSonIndex] = x;
            pos = minSonIndex;
          } else {
            break;
          }
          queue.removeLast();
        }
        print(ans);
      } else if (queue.length == 1) {
        print(queue.first);
        queue.removeAt(0);
      } else if (queue.length == 2) {
        if (queue.last > queue.first) {
          print(queue.last);
          queue.removeLast();
        } else {
          print(queue.first);
          queue.removeAt(0);
        }
      }
    }
  }
}


      // for (int i = 0; queue.length ~/ 2 - 1 > i; i++) {
        // if (queue[2 * i + 1] > queue[2 * i + 2]) {
        //   int x = queue[2 * i + 1];
        //   queue[2 * i + 1] = queue[2 * i + 2];
        //   queue[2 * i + 2] = x;
        // }
      // }





  // popHeap(List<int> queue) {
  //   if (queue.length == 2) {
  //     if (queue.last > queue.first) {
  //       return queue.last;
  //     } else {
  //       return queue.first;
  //     }
  //   }
  //   int ans = queue.last;
  //   queue[0] = queue.last;
  //   int pos = 0;
  //   while (pos * 2 + 2 < queue.length) {
  //     int minSonIndex = pos * 2 + 1;
  //     if (queue[pos * 2 + 2] < queue[minSonIndex]) {
  //       minSonIndex = pos * 2 + 2;
  //     } else if (queue[pos] > queue[minSonIndex]) {
  //       int x = queue[pos];
  //       queue[pos] = queue[minSonIndex];
  //       queue[minSonIndex] = x;
  //       pos = minSonIndex;
  //     } else {
  //       break;
  //     }
  //     queue.removeLast();
  //   }
  //   return ans;
  // }