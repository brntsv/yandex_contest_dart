// import 'dart:io';

// void main() {
//   List<String> lines = File('bin/contest/1_grades/input.txt').readAsLinesSync();
//   List<int> grades = lines[0].split(' ').map(int.parse).toList();
//   grades.sort();
//   int a = grades[0];
//   int b = grades[1];
//   int c = grades[2];

//   print(b);
// }
 
import 'dart:io';

void main() {
  List<String> lines = File('bin/contest/1_grades/input.txt').readAsLinesSync();
  List<int> grades = lines[0].split(' ').map(int.parse).toList();
  int a = grades[0];
  int b = grades[1];
  int c = grades[2];

  if (a == c || (a > c && a < b) || (a > b && a < c)) {
    print(a);
  } else if (a == b || b == c || (a < b && b < c) || (a > b && b > c)) {
    print(b);
  } else {
    print(c);
  }
}
































  // grades.sort();
  // int a = grades[0];
  // int b = grades[1];
  // int c = grades[2];

  // if (a == c && a == b) {
  //   print(a);
  // } else if (a == b || b == c || (a < b && b < c)) {
  //   print(b);
  // }



  // // Если два первых числа равны или меньше третьего числа, то итоговая оценка равна второму числу
  // if (a == b || b <= c) {
  //   print(b);
  // }
  // // Если два последних числа равны или больше первого числа, то итоговая оценка равна второму числу
  // else if (b == c || a >= b) {
  //   print(b);
  // }
  // // Иначе итоговая оценка равна третьему числу
  // else {
  //   print(c);
  // }



  //   if (a == b || a == c) {
  //   print(a);
  // } else if (b == c || (a < b && b < c)) {
  //   print(b);
  // } else {
  //   print(c);
  // }