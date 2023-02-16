import 'dart:io';
// https://contest.yandex.ru/contest/45468/problems/12/

void main() {
  List<String> lines =
      File('bin/3.0/1/12_correct_bracket_sequence/input.txt').readAsLinesSync();
  List<String> brackets = lines[0].split('');
  List<String> stack = [];
  String isValidBrackets() {
    if (brackets.first == ')' ||
        brackets.first == ']' ||
        brackets.first == '}') {
      return 'no';
    }
    for (var bracket in brackets) {
      if ((stack.isNotEmpty && stack.last == '[' && bracket == ']') ||
          (stack.isNotEmpty && stack.last == '(' && bracket == ')') ||
          (stack.isNotEmpty && stack.last == '{' && bracket == '}')) {
        stack.removeLast();
      } else if (stack.isEmpty &&
          (bracket == ')' || bracket == ']' || bracket == '}')) {
        return 'no';
      } else {
        stack.add(bracket);
      }
    }
    if (stack.isEmpty) {
      return 'yes';
    } else {
      return 'no';
    }
  }

  print(isValidBrackets());
}
