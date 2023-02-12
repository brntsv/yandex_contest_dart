import 'dart:io';
// https://contest.yandex.ru/contest/27393/problems/I/

void main() {
  List<String> lines =
      File('bin/1.0/i_prisoner_of_the_castle_if/input.txt').readAsLinesSync();
  int a = int.parse(lines[0]);
  int b = int.parse(lines[1]);
  int c = int.parse(lines[2]);
  int d = int.parse(lines[3]);
  int e = int.parse(lines[4]);

  bool isCanThrowAway(int a, int b, int c, int d, int e) {
    List<int> brick = [a, b, c]..sort();
    List<int> hole = [d, e]..sort();

    if (brick[0] <= hole[0] && brick[1] <= hole[1]) {
      return true;
    } else {
      return false;
    }
  }

  print(isCanThrowAway(a, b, c, d, e) ? 'YES' : 'NO');
}
