import 'dart:io';
// https://contest.yandex.ru/contest/27472/problems/D/

void main() {
  List<String> lines =
      File('bin/1.0/2/d_bigger_than_neighbors/input.txt').readAsLinesSync();
  List<int> input = lines[0].split(' ').map((e) => int.parse(e)).toList();
  int countBiggerNeightbour(List<int> input) {
    int count = 0;
    for (int i = 1; input.length - 1 > i; i++) {
      if (input[i] > input[i - 1] && input[i] > input[i + 1]) {
        count++;
      }
    }
    return count;
  }

  print(countBiggerNeightbour(input));
}
