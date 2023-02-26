import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/19/

void main() {
  List<String> lines = File('bin/3.0/2/19_heepui/input.txt').readAsLinesSync();
  List<int> heap = [];

  insert(int value) {
    heap.add(value);
    int pos = heap.length - 1;
    int indexParent = (pos - 1) ~/ 2;
    while (heap[pos] > heap[indexParent]) {
      int x = heap[pos];
      heap[pos] = heap[indexParent];
      heap[indexParent] = x;
      pos = indexParent;
      indexParent = (pos - 1) ~/ 2;
    }
  }

  extract() {
    int maxValue = heap[0];
    heap[0] = heap.last;
    heap.removeLast();
    int pos = 0;
    int maxIndex = 0;
    while (pos * 2 + 1 < heap.length) {
      if (pos * 2 + 2 == heap.length) {
        maxIndex = pos * 2 + 1;
      } else if (heap[pos * 2 + 1] > heap[pos * 2 + 2]) {
        maxIndex = pos * 2 + 1;
      } else {
        maxIndex = pos * 2 + 2;
      }
      if (heap[pos] < heap[maxIndex]) {
        int x = heap[pos];
        heap[pos] = heap[maxIndex];
        heap[maxIndex] = x;
        pos = maxIndex;
      } else {
        break;
      }
    }
    return maxValue;
  }

  for (int i = 1; lines.length > i; i++) {
    List<String> input = lines[i].split(' ');
    if (input[0] == '0') {
      insert(int.parse(input[1]));
    } else if (input[0] == '1') {
      print(extract());
    }
  }
}
