import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/15/

void main() {
  List<String> lines =
      File('bin/3.0/1/15_lainland_migration/input.txt').readAsLinesSync();
  List<int> prices = lines[1].split(' ').map((e) => int.parse(e)).toList();
  List<List<int>> stack = [
    [prices[0], 0]
  ];
  List<int> result = List.filled(prices.length, -1);
  for (int i = 1; prices.length > i; i++) {
    if (prices[i] < stack.last[0]) {
      while (stack.isNotEmpty && prices[i] < stack.last[0]) {
        result[stack.last[1]] = i;
        stack.removeLast();
      }
    }
    stack.add([prices[i], i]);
  }
  print(result.join(' '));
}
