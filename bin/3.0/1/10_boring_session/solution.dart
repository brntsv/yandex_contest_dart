import 'dart:collection';
import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/10/

void main() {
  List<String> lines =
      File('bin/3.0/1/10_boring_session/input.txt').readAsLinesSync();
  List<String> input = lines[0].split('');
  SplayTreeMap<String, int> result = SplayTreeMap();
  for (int i = 0; input.length > i; i++) {
    if (i == 0 || i == input.length - 1) {
      result.update(input[i], (value) => value + input.length,
          ifAbsent: () => input.length);
    } else {
      int startSublist = i + 1;
      int endSublist = input.length - i;
      result.update(input[i], (value) => value + startSublist * endSublist,
          ifAbsent: () => startSublist * endSublist);
    }
  }
  result.forEach((key, value) {
    print('$key: $value');
  });
}











  // sorted.forEach((key, value) {
  //   print('$key: $value');
  // });