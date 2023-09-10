import 'dart:io';

void main() {
  List<String> lines = File('bin/coderun/easy/rle/input.txt').readAsLinesSync();
  List<String> input = lines[0].split('');
  List<dynamic> rle = [];
  for (var item in input) {
    if (int.tryParse(item) != null) {
      rle.add(int.parse(item));
    } else {
      rle.add(item);
    }
  }
  int ans = 0;
  for (int i = 0; rle.length > i; i++) {
     if (i == rle.length - 1 && rle[i] is String) {
      ans++;
    } else if (i == rle.length - 1 && rle[i] is int) {
      ans += rle[i] as int;
    } else if (rle[i] is String && rle[i + 1] is String) {
      ans++;
    } else if (rle[i] is int && rle[i + 1] is String) {
      ans += rle[i] as int;
    } else if (rle[i] is int && rle[i + 1] is int) {
      rle[i + 1] = int.parse('${rle[i]}${rle[i + 1]}');
    } else if (rle[i] is String && rle[i + 1] is int) {
      continue;
    } 
  }
  print(ans);
}
