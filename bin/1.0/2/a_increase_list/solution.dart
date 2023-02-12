import 'dart:io';
// https://contest.yandex.ru/contest/27472/problems/

void main() {
  List<String> lines =
      File('bin/1.0/2/a_increase_list/input.txt').readAsLinesSync();
  List<String> input = lines[0].split(' ');
  List<int> inputInt = input.map((e) => int.parse(e)).toList();

  isIncreasingList(List<int> inputInt) {
    for (int i = 0; inputInt.length - 1 > i; i++) {
      if (inputInt[i] < inputInt[i + 1]) {
        continue;
      } else {
        return 'NO';
      }
    }
    return 'YES';
  }

  print(isIncreasingList(inputInt));
}
