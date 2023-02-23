import 'dart:io';
import 'dart:math';

// https://contest.yandex.ru/contest/45468/problems/8/

void main() {
  List<String> lines =
      File('bin/3.0/warm_up/8_minimal_rectangle/input.txt').readAsLinesSync();
  List<String> input = [];
  for (int i = 1; lines.length > i; i++) {
    input.addAll(lines[i].split(' '));
  }
  List<int> coordinates = input.map((e) => int.parse(e)).toList();
  List<int> listX = [];
  List<int> listY = [];
  for (int i = 0; coordinates.length > i; i++) {
    if (i.isEven) {
      listX.add(coordinates[i]);
    } else {
      listY.add(coordinates[i]);
    }
  }
  int minX = listX.reduce(min);
  int minY = listY.reduce(min);
  int maxX = listX.reduce(max);
  int maxY = listY.reduce(max);

  print('$minX $minY $maxX $maxY');
}
