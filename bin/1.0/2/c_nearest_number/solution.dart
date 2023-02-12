import 'dart:io';
// https://contest.yandex.ru/contest/27472/problems/C/

void main() {
  List<String> lines =
      File('bin/1.0/2/c_nearest_number/input.txt').readAsLinesSync();
  List<int> arr = lines[1].split(' ').map((e) => int.parse(e)).toList();
  int target = int.parse(lines[2]);

  nearestNumber(List<int> arr, int target) {
    int nearest = arr[0];
    int minDiff = (target - nearest).abs();

    for (int i = 0; arr.length > i; i++) {
      int diff = (target - arr[i]).abs();
      if (diff < minDiff) {
        minDiff = diff;
        nearest = arr[i];
      }
    }
    return nearest;
  }

  print(nearestNumber(arr, target));
}
