import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/35/

void main() {
  List<String> lines =
      File('bin/3.0/5/35_cycle_search/input.txt').readAsLinesSync();
  int n = int.parse(lines[0]);
  bool isCycle = false;
  bool isFinished = false;
  int startCycle = 0;
  List<int> cycle = [];
  dfs(List<List<dynamic>> graphs, int now, int? parent) {
    graphs[now][0] = 1;
    for (var neig in graphs[now][1]) {
      if (neig == parent) {
        continue;
      }
      if (graphs[neig][0] == 1 && !isCycle) {
        isCycle = true;
        isFinished = false;
        startCycle = neig;
        cycle.add(startCycle);
      }
      if (graphs[neig][0] == 0 && !isCycle) {
        dfs(graphs, neig, now);
      }
    }
    if (isCycle && !isFinished) {
      if (now == startCycle) {
        isFinished = true;
      } else {
        cycle.add(now);
      }
    }
  }

  List<List<dynamic>> graphs = List.generate(n + 1, (int i) => [0, []]);
  for (int i = 1; n + 1 > i; i++) {
    List<int> ribs = lines[i].split(' ').map((e) => int.parse(e)).toList();
    for (var j = 0; n > j; j++) {
      if (ribs[j] == 1) {
        graphs[i][1].add(j + 1);
      }
    }
  }

  for (int i = 1; n + 1 > i; i++) {
    if (graphs[i][0] == 1) {
      continue;
    }
    try {
      dfs(graphs, i, null);
    } catch (e) {}
    if (isCycle) {
      break;
    }
  }
  if (isCycle) {
    print('YES');
    print(cycle.length);
    print(cycle.join(' '));
  } else {
    print('NO');
  }
}
