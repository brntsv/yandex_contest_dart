import 'dart:io';
import 'dart:math';
// https://contest.yandex.ru/contest/27472/problems/G/

void main() {
  List<String> lines = File('bin/1.0/2/g_max_product_of_two_numbers/input.txt')
      .readAsLinesSync();
  List<int> input = lines[0].split(' ').map((e) => int.parse(e)).toList();

  maxProduct(List<int> input) {
    int minFirst = input.reduce(min);
    input.remove(minFirst);
    int minSecond = input.reduce(min);

    int maxFirst = input.reduce(max);
    input.remove(maxFirst);
    int maxSecond = input.reduce(max);

    if (minFirst * minSecond > maxFirst * maxSecond) {
      return '$minFirst $minSecond';
    } else {
      return '$maxSecond $maxFirst';
    }
  }

  print(maxProduct(input));
}
