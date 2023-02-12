import 'dart:io';
// https://contest.yandex.ru/contest/27472/problems/B/

//  arr = [-530, -530, -530, -530, -530]   CONSTANT
//  arr = [5, 4, 3, 2, 1]   DESCENDING
//  arr = [5, 4, 4, 2, 1]   WEAKLY DESCENDING
//  arr = [1, 2, 3, 4, 5]   ASCENDING
//  arr = [1, 2, 3, 3, 5]   WEAKLY ASCENDING
//  arr = [1, 5, 3, 2, 4]   RANDOM

void main() {
  List<String> lines =
      File('bin/1.0/2/b_determine_sequence_type/input.txt').readAsLinesSync();
  List<int> input = lines.map((e) => int.parse(e)).toList();

  determineSequenceType(List<int> input) {
    String ans = '';
    for (int i = 1; input.length > i; i++) {
      if (input[i] > input[i - 1]) {
        if (ans == 'DESCENDING' || ans == 'WEAKLY DESCENDING') {
          return 'RANDOM';
        } else if (ans == 'CONSTANT' || ans == 'WEAKLY ASCENDING') {
          ans = 'WEAKLY ASCENDING';
        } else {
          ans = 'ASCENDING';
        }
      } else if (input[i - 1] > input[i]) {
        if (ans == 'ASCENDING' || ans == 'WEAKLY ASCENDING') {
          return 'RANDOM';
        } else if (ans == 'CONSTANT' || ans == 'WEAKLY DESCENDING') {
          ans = 'WEAKLY DESCENDING';
        } else {
          ans = 'DESCENDING';
        }
      } else {
        if (ans == 'DESCENDING') {
          ans = 'WEAKLY DESCENDING';
        } else if (ans == 'ASCENDING') {
          ans = 'WEAKLY ASCENDING';
        } else if (ans == '') {
          ans = 'CONSTANT';
        }
      }
      if (input[i + 1] == -2000000000) break;
    }
    return ans;
  }

  print(determineSequenceType(input));
}
