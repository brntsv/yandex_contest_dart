import 'dart:io';
// https://contest.yandex.ru/contest/27472/problems/F/

// 1 2 3 4 5

void main() {
  List<String> lines =
      File('bin/1.0/2/f_symmetric_sequence/input.txt').readAsLinesSync();
  List<int> input = lines[1].split(' ').map((e) => int.parse(e)).toList();
  bool isPalindrome(List<int> input) {
    if (input.join() == input.reversed.join()) {
      return true;
    }
    return false;
  }

  makeSymmetric(List<int> input) {
    if (isPalindrome(input)) return 0;
    int count = 0;
    List<int> result = [];
    for (int i = input.length - 1; i > 0; i--) {
      if (input[i] != input[i - 1]) {
        count++;
        result.add(input[i - 1]);
      }
    }
    print(count);
    return result.join(' ');
  }

  print(makeSymmetric(input));
}
