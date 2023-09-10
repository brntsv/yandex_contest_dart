import 'dart:io';
import 'dart:math';

void main() {
    List<String> lines =
      File('bin/coderun/easy/restore_matrix/input.txt').readAsLinesSync();
  int n = int.parse(lines[0]);

  List<List<int>> matrix = List.generate(n, (_) => List<int>.filled(n, 0));
  List<int> availableNumbers = List.generate(n * n, (i) => i + 1);

  for (int i = 0; i < n; i++) {
    List<int> line = lines[i + 1].split(' ').map(int.parse).toList();
    for (int j = 0; j < n; j++) {
      if (line[j] != 0) {
        matrix[i][j] = line[j];
        availableNumbers.remove(line[j]);
      }
    }
  }

  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (matrix[i][j] == 0) {
        matrix[i][j] = availableNumbers.removeAt(Random().nextInt(availableNumbers.length));
      }
    }
    print(matrix[i].join(' '));
  }
}