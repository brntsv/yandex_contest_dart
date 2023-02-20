import 'dart:io';

// https://contest.yandex.ru/contest/45468/problems/3/

void main() {
  List<String> lines = File('bin/3.0/1/3_diego/input.txt').readAsLinesSync();
  List<int> stickDiego =
      lines[1].split(' ').map((e) => int.parse(e)).toSet().toList()..sort();
  List<int> stickersK = lines[3].split(' ').map((e) => int.parse(e)).toList();
  List<int> result = [];
  for (int sticker in stickersK) {
    int l = 0;
    int r = stickDiego.length;
    while (l < r) {
      int m = (l + r + 1) ~/ 2;
      if (m < stickDiego.length && stickDiego[m] < sticker) {
        l = m;
      } else {
        r = m - 1;
      }
    }
    if (stickDiego[l] < sticker) {
      result.add(l + 1);
    } else {
      result.add(r);
    }
  }
  print(result.join('\n'));
}


// import 'dart:io';

// // https://contest.yandex.ru/contest/45468/problems/3/

// Future<void> main() async {
//   List<String> lines = File('bin/3.0/1/3_diego/input.txt').readAsLinesSync();
//   final outputFile = File('./output.txt').openWrite();
//   List<int> stickDiego =
//       lines[1].split(' ').map((e) => int.parse(e)).toSet().toList()..sort();
//   List<int> stickersK = lines[3].split(' ').map((e) => int.parse(e)).toList();
//   for (int sticker in stickersK) {
//     int l = 0;
//     int r = stickDiego.length;
//     while (l < r) {
//       int m = (l + r + 1) ~/ 2;
//       if (m < stickDiego.length && stickDiego[m] < sticker) {
//         l = m;
//       } else {
//         r = m - 1;
//       }
//     }
//     if (stickDiego[l] < sticker) {
//       outputFile.writeln(l + 1);
//     } else {
//       outputFile.writeln(r);
//     }
//   }
//   await outputFile.close();
// }






  // for (int i = 0; stickersK.length > i; i++) {
  //   int stickersCount = 0;
  //   for (int j = 0; stickDiego.length > j; j++) {
  //     if (stickersK[i] > stickDiego[j]) {
  //       stickersCount++;
  //     }
  //   }
  //   print(stickersCount);
  // }





