import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/45468/problems/

void main() {
  List<String> lines =
      File('bin/3.0/0_warm_up/1_bar_chart/input.txt').readAsLinesSync();
  List<String> input = [];
  Map<String, int> map = {};
  for (var line in lines) {
    input.addAll(line.split(''));
  }
  input
    ..removeWhere((e) => e == ' ')
    ..sort();
  for (int i = 0; input.length > i; i++) {
    if (map.containsKey(input[i])) {
      map.update(input[i], (count) => count + 1);
    } else {
      map.addEntries({input[i]: 1}.entries);
    }
  }
  int maxStringNumber = map.values.reduce(max);
  List<int> mapValues = map.values.toList();
  List<String> output = [];
  for (int j = maxStringNumber; j > 0; j--) {
    for (int i = 0; mapValues.length > i; i++) {
      if (mapValues[i] < j) {
        output.add(' ');
      } else {
        output.add('#');
      }
    }
    print(output.join());
    output.clear();
  }

  print(map.keys.join());
}
