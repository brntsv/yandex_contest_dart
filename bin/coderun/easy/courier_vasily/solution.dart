import 'dart:io';

void main() {
  List<String> lines =
      File('bin/coderun/easy/courier_vasily/input.txt').readAsLinesSync();
  List<int> input = lines[0].split(' ').map(int.parse).toList();
  int s = input[0];

  List<int> a = lines[1].split(' ').map(int.parse).toList();
  a.sort();

  int totalDistance = a.last - a.first;
  int res = 0;
  if (s < a.first) {
    res = a.first - s + totalDistance;
  } else if (s > a.last) {
    res = s - a.last + totalDistance;
  } else if (s == a.first || s == a.last) {
    res = totalDistance;
  } else if (a.first < s && s < a.last) {
    if ((s - a.first) > (a.last - s)) {
      res = (a.last - s) * 2 + (s - a.first);
    } else {
      res = (s - a.first) * 2 + (a.last - s);
    }
  }
  print(res);
}
