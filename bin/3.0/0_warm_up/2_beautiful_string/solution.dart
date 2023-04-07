import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/45468/problems/2/

// O(a*n), где a - размер алфавита

void main() {
  List<String> lines =
      File('bin/3.0/0_warm_up/2_beautiful_string/input.txt').readAsLinesSync();
  List<String> input = lines[1].split('');
  List<String> letters = List.generate(26, (i) => String.fromCharCode(i + 97));
  int maxRepeat = 0;
  for (var letter in letters) {
    int k = int.parse(lines[0]);
    int repeat = 0;
    int j = 0;

    for (int i = 0; input.length - 1 > i; i++) {
      if (i > 0) {
        if (input[i - 1] != letter) {
          k = k + 2;
        }
      }
      while (k >= 0 && input.length > j) {
        if (letter == input[j]) {
          j++;
        } else if (letter != input[j]) {
          if (k > 0) {
            k--;
            j++;
          } else {
            k--;
          }
        }
      }
      repeat = max(repeat, j - i);
      repeat > maxRepeat ? maxRepeat = repeat : maxRepeat;
    }
  }
  print(maxRepeat);
}
