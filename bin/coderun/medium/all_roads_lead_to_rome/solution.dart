import 'dart:io';

void main() {
  List<String> lines =
      File('bin/coderun/medium/all_roads_lead_to_rome/input.txt')
          .readAsLinesSync();
  List<int> input = lines[0].split(' ').map(int.parse).toList();
  int n = input[0];
  int m = input[1];

  List<Set<int>> graph = List.generate(n + 1, (_) => {});

  for (int i = 1; i <= m; i++) {
    List<int> line = lines[i].split(' ').map(int.parse).toList();
    int a = line[0];
    int b = line[1];
    if (a == b) {
      continue;
    }
    graph[a].add(b);
  }

  List<int> topSort = [];
  List<bool> visited = List.filled(n + 1, false);

  void dfs(int v) {
    visited[v] = true;
    for (int u in graph[v]) {
      if (!visited[u]) {
        dfs(u);
      }
    }
    topSort.add(v);
  }

  for (int i = 1; i <= n; i++) {
    if (!visited[i]) {
      dfs(i);
    }
  }

  int capital = topSort[0];

  for (int i = 1; i < topSort.length; i++) {
    int v = topSort[i];
    if (!graph[v].contains(capital)) {
      capital = -1;
      break;
    }
  }

  print(capital);
}
