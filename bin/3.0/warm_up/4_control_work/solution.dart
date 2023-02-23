import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/4/

void main() {
  List<String> lines =
      File('bin/3.0/warm_up/4_control_work/input.txt').readAsLinesSync();
  int n = int.parse(lines[0]);
  int k = int.parse(lines[1]);
  int row = int.parse(lines[2]);
  int column = int.parse(lines[3]);

  int place = (row - 1) * 2 + column;
  List<int> result = [0, 0];
  if (k + place <= n) {
    result[0] = (k + place + 1) ~/ 2;
    result[1] = (k + place) % 2 == 0 ? 2 : 1;
  }
  if (place - k >= 1) {
    if (row - ((place - k + 1) ~/ 2) < (result[0] - row).abs()) {
      result[0] = (place - k + 1) ~/ 2;
      result[1] = (place - k) % 2 == 0 ? 2 : 1;
    }
  }
  if (result[0] == 0) {
    print('-1');
  } else {
    print('${result[0]} ${result[1]}');
  }
}
