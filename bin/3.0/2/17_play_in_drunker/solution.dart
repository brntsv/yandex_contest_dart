import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/17/

void main() {
  List<String> lines =
      File('bin/3.0/2/17_play_in_drunker/input.txt').readAsLinesSync();
  List<String> listOne = lines[0].split(' ');
  List<String> listTwo = lines[1].split(' ');
  List<int> first = [];
  List<int> second = [];
  for (var item in listOne) {
    if (int.tryParse(item) != null) {
      first.add(int.parse(item));
    }
  }
  for (var item in listTwo) {
    if (int.tryParse(item) != null) {
      second.add(int.parse(item));
    }
  }

  int count = 0;
  while (first.isNotEmpty && second.isNotEmpty) {
    if (first[0] == 0 && second[0] == 9) {
      first
        ..add(first[0])
        ..add(second[0]);
      first.removeAt(0);
      second.removeAt(0);
      count++;
    } else if (second[0] == 0 && first[0] == 9) {
      second
        ..add(first[0])
        ..add(second[0]);
      first.removeAt(0);
      second.removeAt(0);
      count++;
    } else if (first[0] > second[0]) {
      first
        ..add(first[0])
        ..add(second[0]);
      first.removeAt(0);
      second.removeAt(0);
      count++;
    } else if (second[0] > first[0]) {
      second
        ..add(first[0])
        ..add(second[0]);
      first.removeAt(0);
      second.removeAt(0);
      count++;
    }
    if (count == 1000000) {
      print('botva');
      break;
    }
  }
  if (first.isEmpty) {
    print('second $count');
  } else if (second.isEmpty) {
    print('first $count');
  }
}
