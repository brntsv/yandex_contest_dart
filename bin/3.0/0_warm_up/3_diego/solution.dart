import 'dart:io';

// https://contest.yandex.ru/contest/45468/problems/3/

void main() {
  List<String> lines =
      File('bin/3.0/warm_up/3_diego/input.txt').readAsLinesSync();
  List<int> stickDiego =
      lines[1].split(' ').map((e) => int.parse(e)).toSet().toList()..sort();
  List<int> stickersK = lines[3].split(' ').map((e) => int.parse(e)).toList();
  List<int> result = [];
  for (int sticker in stickersK) {
    int l = 0;
    int r = stickDiego.length;
    while (l < r) {
      int m = (l + r + 1) ~/ 2;
      if (m < stickDiego.length && stickDiego[m] < sticker) {
        l = m;
      } else {
        r = m - 1;
      }
    }
    if (stickDiego[l] < sticker) {
      result.add(l + 1);
    } else {
      result.add(r);
    }
  }
  print(result.join('\n'));
}
