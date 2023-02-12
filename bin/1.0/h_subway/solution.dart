import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/27393/problems/H/

void main() {
  List<String> lines = File('bin/1.0/h_subway/input.txt').readAsLinesSync();
  int a = int.parse(lines[0]);
  int b = int.parse(lines[1]);
  int n = int.parse(lines[2]);
  int m = int.parse(lines[3]);

  minAndMaxTime(int a, int b, int n, int m) {
    int minFirst = a * (n - 1) + n;
    int minSecond = b * (m - 1) + m;
    int maxFirst = a * (n + 1) + n;
    int maxSecond = b * (m + 1) + m;
    int minT = max(minFirst, minSecond);
    int maxT = min(maxFirst, maxSecond);

    if (maxT > minT) {
      return '$minT $maxT';
    } else {
      return '-1';
    }
  }

  print(minAndMaxTime(a, b, n, m));
}
