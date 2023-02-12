import 'dart:io';
// https://contest.yandex.ru/contest/27393/problems/B/

void main() {
  List<String> lines = File('bin/1.0/b_triangle/input.txt').readAsLinesSync();

  int a = int.parse(lines[0]);
  int b = int.parse(lines[1]);
  int c = int.parse(lines[2]);

  bool isTriangle(int a, int b, int c) {
    if (a > 0 && b > 0 && c > 0) {
      if ((a + b) > c && (a + c) > b && (b + c) > a) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  print(isTriangle(a, b, c) ? 'YES' : 'NO');
}
