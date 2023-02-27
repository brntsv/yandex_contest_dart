import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/9/

void main() {
  List<String> lines =
      File('bin/3.0/0_warm_up/9_sum_in_rectangle/input.txt').readAsLinesSync();
  int n = int.parse(lines[0].split(' ')[0]);
  int m = int.parse(lines[0].split(' ')[1]);
  int k = int.parse(lines[0].split(' ')[2]);
  List<List<int>> matrix = [];
  for (int i = 1; n >= i; i++) {
    List<String> lineStr = lines[i].split(' ');
    List<int> line = [];
    for (String item in lineStr) {
      if (int.tryParse(item) != null) {
        line.add(int.parse(item));
      }
    }
    matrix.add(line);
  }
  List<List<int>> prefix =
      List.generate(n + 1, (int index) => List.generate(m + 1, (index) => 0));

  for (int i = 1; n >= i; i++) {
    for (int j = 1; m >= j; j++) {
      prefix[i][j] = matrix[i - 1][j - 1] +
          prefix[i - 1][j] +
          prefix[i][j - 1] -
          prefix[i - 1][j - 1];
    }
  }

  List<List<int>> coordinates = [];
  for (int i = n + 1; n + k >= i; i++) {
    coordinates.add(lines[i].split(' ').map((e) => int.parse(e)).toList());
  }

  for (int i = 0; k > i; i++) {
    int x1 = coordinates[i][0];
    int y1 = coordinates[i][1];
    int x2 = coordinates[i][2];
    int y2 = coordinates[i][3];

    int ans = prefix[x2][y2] -
        prefix[x2][y1 - 1] -
        prefix[x1 - 1][y2] +
        prefix[x1 - 1][y1 - 1];

    print(ans);
  }
}
