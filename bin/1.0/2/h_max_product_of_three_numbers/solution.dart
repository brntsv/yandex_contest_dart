import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/27472/problems/H/

// [1, -2, -3, -44]

void main() {
  List<String> lines =
      File('bin/1.0/2/h_max_product_of_three_numbers/input.txt')
          .readAsLinesSync();
  List<int> input = lines[0].split(' ').map((e) => int.parse(e)).toList();

  maxProduct(List<int> input) {
    int minFirst = input.reduce(min);
    input.remove(minFirst);
    int minSecond = input.reduce(min);
    input.remove(minSecond);
    int minThird = input.reduce(min);
    input.addAll([minFirst, minSecond]);

    int maxFirst = input.reduce(max);
    input.remove(maxFirst);
    int maxSecond = input.reduce(max);
    input.remove(maxSecond);
    int maxThird = input.reduce(max);
    input.addAll([maxFirst, maxSecond]);

    if (minFirst * minSecond * minThird > maxFirst * maxSecond * maxThird) {
      return '$minFirst $minSecond $minThird';
    } else {
      return '$maxFirst $maxSecond $maxThird';
    }
  }

  print(maxProduct(input));
}
