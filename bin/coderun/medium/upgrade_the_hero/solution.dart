import 'dart:io';

// O(n log(n)) + O(n)

void main() {
  List<String> lines =
      File('bin/coderun/medium/upgrade_the_hero/input.txt').readAsLinesSync();
  List<int> a = lines[1].split(' ').map(int.parse).toList();
  a.sort();
  int ans = 0;
  if (a.first.isNegative && a.last.isNegative && a.length.isEven) {
    ans = a.first;
  } else if (a.first.isNegative && a.last.isNegative && a.length.isOdd) {
    ans = a.last;
  } else if (!a.first.isNegative && !a.last.isNegative) {
    ans = a.first;
  } else if (a.first.isNegative && !a.last.isNegative) {
    int l = 0;
    while (a[l].isNegative) {
      l++;
    }
    if (a[l] == 0 && l.isOdd) {
      ans = a.first;
    } else if (a[l] == 0 && l.isEven) {
      ans = 0;
    } else if (a[l] != 0 && l.isOdd) {
      ans = a[l - 1];
    } else if (a[l] != 0 && l.isEven) {
      ans = a[l];
    }
  }
  print(ans);
}
