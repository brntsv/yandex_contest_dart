import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/45468/problems/24/

void main() {
  List<String> lines =
      File('bin/3.0/3/24_buying_tickets/input.txt').readAsLinesSync();
  int n = int.parse(lines[0]);
  List<List<double>> persons = [
    [double.infinity, double.infinity, double.infinity],
    [double.infinity, double.infinity, double.infinity],
    [double.infinity, double.infinity, double.infinity]
  ];
  for (int i = 1; n >= i; i++) {
    List<String> lineStr = lines[i].split(' ');
    List<double> timePerson = [];
    for (String item in lineStr) {
      if (int.tryParse(item) != null) {
        timePerson.add(double.parse(item));
      }
    }
    persons.add(timePerson);
  }
  List<double> dp = List.filled(n + 3, 0);
  for (int i = 3; n + 3 > i; i++) {
    dp[i] = [
      dp[i - 1] + persons[i][0],
      dp[i - 2] + persons[i - 1][1],
      dp[i - 3] + persons[i - 2][2]
    ].reduce(min);
  }
  print(dp.last.toInt());
}
