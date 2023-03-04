import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/31/

void main() {
  List<String> lines =
      File('bin/3.0/5/31_search_in_deep/input.txt').readAsLinesSync();
  List<int> input = lines[0].split(' ').map((e) => int.parse(e)).toList();
  int n = input[0];
  int m = input[1];
  List<List<int>> ribs = [];
  for (int i = 1; m >= i; i++) {
    ribs.add(lines[i].split(' ').map((e) => int.parse(e)).toList());
  }
  Map<int, Set<int>> graphs = {};
  for (var rib in ribs) {
    if (graphs.containsKey(rib[0])) {
      graphs.update(rib[0], (value) => value..add(rib[1]));
    } else {
      graphs.addEntries({
        rib[0]: {rib[1]}
      }.entries);
    }
    if (graphs.containsKey(rib[1])) {
      graphs.update(rib[1], (value) => value..add(rib[0]));
    } else {
      graphs.addEntries({
        rib[1]: {rib[0]}
      }.entries);
    }
  }
  List<bool> visited = List.filled(n + 1, false);
  List<int> comp = [];
  dfs(Map<int, Set<int>> graphs, List<bool> visited, int now) {
    visited[now] = true;
    if (graphs[now] != null) {
      for (var neig in graphs[now]!) {
        if (!visited[neig]) {
          dfs(graphs, visited, neig);
        }
      }
      comp.add(now);
    } else {
      comp.add(now);
    }
  }

  dfs(graphs, visited, 1);
  comp.sort();
  print(comp.length);
  print(comp.join(' '));
}
