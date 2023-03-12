import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/36/

void main() {
  List<String> lines =
      File('bin/3.0/6/36_length_shortest_path/input.txt').readAsLinesSync();
  int n = int.parse(lines[0]);

  bfs(List<List<dynamic>> graphs, List<List<int>> paths, int now) {
    if (paths[0].isEmpty) {
      paths[0].add(now);
    }
    for (var i = 0; paths.length > i; i++) {
      for (var vertex in paths[i]) {
        graphs[vertex][0] = 2;
        for (var neigh in graphs[vertex][1]) {
          if (graphs[neigh][0] == 0) {
            paths[i + 1].add(neigh);
            graphs[neigh][0] = 1;
          }
        }
      }
    }
  }

  List<List<int>> paths = List.generate(n + 1, (_) => []);

  List<List<dynamic>> graphs = List.generate(n + 1, (int i) => [0, []]);
  for (int i = 1; n + 1 > i; i++) {
    List<String> lineStr = lines[i].split(' ');
    List<int> line = [];
    for (String item in lineStr) {
      if (int.tryParse(item) != null) {
        line.add(int.parse(item));
      }
    }
    for (var j = 0; n > j; j++) {
      if (line[j] == 1) {
        graphs[i][1].add(j + 1);
      }
    }
  }
  List<int> lastLine =
      lines[n + 1].split(' ').map((e) => int.parse(e)).toList();
  int start = lastLine[0];
  int end = lastLine[1];

  bfs(graphs, paths, start);
  int lenAns = -1;

  for (var i = 0; paths.length > i; i++) {
    if (lenAns != -1) {
      break;
    }
    for (var vertex in paths[i]) {
      if (vertex == end) {
        lenAns = i;
        break;
      }
    }
  }
  print(lenAns);
}
