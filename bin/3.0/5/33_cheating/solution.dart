import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/33/

void main() {
  List<String> lines =
      File('bin/3.0/5/33_cheating/input.txt').readAsLinesSync();
  List<int> input = lines[0].split(' ').map((e) => int.parse(e)).toList();
  int n = input[0];
  int m = input[1];
  bool isBipartide = true;
  dfs(List<List<dynamic>> graphs, List<bool> visited, int now, int color) {
    try {
      if (!visited[now]) {
        visited[now] = true;
        if (color == 1) {
          graphs[now][0] = 1;
          color = 2;
        } else {
          graphs[now][0] = 2;
          color = 1;
        }
        for (var neig in graphs[now][1]) {
          if (graphs[neig][0] == graphs[now][0]) {
            isBipartide = false;
          }
          if (!visited[neig]) {
            dfs(graphs, visited, neig, color);
          }
        }
      }
    } catch (e) {}
  }

  List<List<dynamic>> graphs = List.generate(n + 1, (int i) => [0, []]);
  for (int i = 1; m >= i; i++) {
    List<int> ribs = lines[i].split(' ').map((e) => int.parse(e)).toList();
    graphs[ribs[0]][1].add(ribs[1]);
    graphs[ribs[1]][1].add(ribs[0]);
  }

  List<bool> visited = List.generate(n + 1, (int i) => false);
  int color = 1;
  for (int i = 1; n + 1 > i; i++) {
    dfs(graphs, visited, i, color);
  }
  if (isBipartide) {
    print('YES');
  } else {
    print('NO');
  }
}
