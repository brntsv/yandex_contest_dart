import 'dart:io';

void main() {
  List<String> lines =
      File('bin/coderun/easy/is_palindrome/input.txt').readAsLinesSync();
  String str = lines[0].replaceAll(' ', '').toLowerCase();
  String isPalindrome() {
    int l = 0, r = str.length - 1;
    while (l <= r) {
      if (str[l] == str[r]) {
        l++;
        r--;
      } else {
        return 'It is not a palindrome';
      }
    }
    return 'It is a palindrome';
  }

  print(isPalindrome());
}
