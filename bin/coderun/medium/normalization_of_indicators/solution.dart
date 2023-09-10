import 'dart:io';

void main() {
  List<String> lines =
      File('bin/coderun/medium/normalization_of_indicators/input.txt')
          .readAsLinesSync(); 
  List<int> a = lines[1].split(' ').map(int.parse).toList();
  int m = int.parse(lines[2]);
  a.sort();

  for (int i = 3; m + 3 > i; i++) {
    int b = int.parse(lines[i]);
    int l = 0;
    int r = a.length - 1;

    while (l < r) {
      int mid = (l + r) ~/ 2;
      if (a[mid] < b) {
        l = mid + 1;
      } else {
        r = mid;
      }
    }
    int closest = a[l];
    if (l > 0) {
      closest = ((b - a[l - 1]).abs() <= (b - a[l]).abs()) ? a[l - 1] : a[l];
    } else if (l == 0 && a.length > 1) {
      closest = ((b - a[0]).abs() <= (b - a[1]).abs()) ? a[0] : a[1];
    } else {
      closest = a[0];
    }
    print(closest);
  }
}
