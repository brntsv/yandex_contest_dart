import 'dart:io';
// https://contest.yandex.ru/contest/27393/problems/D/

/*
    sqrt(ax + b) = c
    ax + b = c^2
    x = (c^2 - b) / a
*/

void main() {
  List<String> lines =
      File('bin/1.0/d_ rooted_equation/input.txt').readAsLinesSync();

  int a = int.parse(lines[0]);
  int b = int.parse(lines[1]);
  int c = int.parse(lines[2]);

  if ((a == 0 && b == 0 && c == 0) || (a == 0 && b == c * c) || (a == 0)) {
    print('MANY SOLUTIONS');
  } else if (c < 0) {
    print('NO SOLUTION');
  } else if ((c * c - b) % a == 0) {
    int result = (c * c - b) ~/ a;
    print(result);
  } else {
    print('NO SOLUTION');
  }
}
