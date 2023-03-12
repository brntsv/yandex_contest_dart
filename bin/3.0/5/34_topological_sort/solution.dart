import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/34/

void main() {
  List<String> lines =
      File('bin/3.0/5/34_topological_sort/input.txt').readAsLinesSync();
  List<int> input = lines[0].split(' ').map((e) => int.parse(e)).toList();
  int n = input[0];
  int m = input[1];
  bool isCycle = false;
  List<int> graphSorted = [];
  dfs(List<List<dynamic>> graphs, int now) {
    graphs[now][0] = 1;
    for (var neig in graphs[now][1]) {
      if (graphs[neig][0] == 0) {
        dfs(graphs, neig);
      } else if (graphs[neig][0] == 2) {
        continue;
      } else {
        isCycle = true;
      }
    }
    graphs[now][0] = 2;
    graphSorted.add(now);
  }

  List<List<dynamic>> graphs = List.generate(n + 1, (int i) => [0, []]);
  for (int i = 1; m >= i; i++) {
    List<int> ribs = lines[i].split(' ').map((e) => int.parse(e)).toList();
    graphs[ribs[0]][1].add(ribs[1]);
  }

  for (int i = 1; n + 1 > i; i++) {
    if (graphs[i][0] == 0) {
      try {
        dfs(graphs, i);
      } catch (e) {}
    }
    if (isCycle) {
      break;
    }
  }
  if (isCycle) {
    print(-1);
  } else {
    print(graphSorted.reversed.join(' '));
  }
}
