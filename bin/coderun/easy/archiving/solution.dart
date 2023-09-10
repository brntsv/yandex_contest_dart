import 'dart:io';

void main() {
    List<String> lines =
      File('bin/coderun/easy/archiving/input.txt').readAsLinesSync();
  String s = lines[0];
  List<String> blocks = [];
  Set<String> seen = {};
  int i = 0;
  while (i < s.length) {
    String prefix = '';
    for (int j = i; j < s.length; j++) {
      String candidate = prefix + s[j];
      if (!seen.contains(candidate)) {
        blocks.add(candidate);
        seen.add(candidate);
        i = j + 1;
        break;
      }
      prefix = candidate;
      if (j == s.length - 1) {
        blocks.add(candidate);
        i = j + 1;
        break;
      }
    }
  }
  print(blocks.join(' '));
}

// В данной задаче мы должны разбить входную строку на блоки согласно заданному алгоритму. 
// Алгоритм состоит из двух шагов:
// Выбрать наибольший префикс данных p, который уже есть среди блоков.
// Разбить оставшуюся часть данных на блоки.

// При этом первый блок образуется из первого символа строки.
// Для решения задачи мы можем просто пройти по строке слева направо и сохранять уже встреченные 
// префиксы в хэш-таблицу. Когда мы встречаем новый символ, мы проверяем, есть ли в хэш-таблице такой 
// префикс. Если есть, то мы начинаем новый блок, добавляя в него этот префикс, а также все последующие 
// символы, которые мы еще не использовали в блоках. Если такого префикса нет, то мы просто добавляем 
// текущий символ в текущий блок.