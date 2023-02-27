import 'dart:io';

// https://contest.yandex.ru/contest/45468/problems/7/

void main() {
  List<String> lines =
      File('bin/3.0/0_warm_up/7_sntp/input.txt').readAsLinesSync();
  List<int> a = lines[0].split(':').map((e) => int.parse(e)).toList();
  List<int> b = lines[1].split(':').map((e) => int.parse(e)).toList();
  List<int> c = lines[2].split(':').map((e) => int.parse(e)).toList();

  int aSec = a[0] * 3600 + a[1] * 60 + a[2];
  int cSec = c[0] * 3600 + c[1] * 60 + c[2];
  int diff = cSec - aSec;
  if (diff.isNegative) {
    diff = cSec + (24 * 3600 - aSec);
  }
  int timeResponse = int.parse((diff / 2).toStringAsFixed(0));

  String calibrateTime() {
    int hrs, min, sec;
    if (timeResponse > 3600) {
      hrs = timeResponse ~/ 3600;
      min = (timeResponse - hrs * 3600) ~/ 60;
      sec = timeResponse - (hrs * 3600) - (min * 60);
    } else if (timeResponse > 60 && timeResponse < 3600) {
      hrs = 0;
      min = timeResponse ~/ 60;
      sec = timeResponse - (min * 60);
    } else {
      hrs = 0;
      min = 0;
      sec = timeResponse;
    }
    List<int> d = [b[0] + hrs, b[1] + min, b[2] + sec];
    if (d[2] > 59) {
      d[1] = d[1] + 1;
      d[2] = d[2] - 60;
    }
    if (d[1] > 59) {
      d[0] = d[0] + 1;
      d[1] = d[1] - 60;
    }
    if (d[0] > 23) {
      d[0] = d[0] - 24;
    }
    return [
      d[0] < 10 ? '0${d[0]}' : d[0],
      d[1] < 10 ? '0${d[1]}' : d[1],
      d[2] < 10 ? '0${d[2]}' : d[2]
    ].join(':');
  }

  print(calibrateTime());
}
