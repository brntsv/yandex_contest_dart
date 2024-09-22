// В десятичную запись числа n нужно добавить несколько знаков минус (возможно ноль),
// чтобы в получившемся выражении все числа были различны. При этом количество чисел,
// на которые будет разбита запись числа n, должно быть наибольшим.

// Напомним, что использовать числа с незначащими нулями не разрешается.

// Формат ввода
// В единственной строке входных данных задано число n (0 ≤n  < 10^19)

// Формат вывода
// Выведите разбиение числа n на части. Между частями поставьте знак '-'.
// Если есть несколько возможных разбиений с наибольшим число различных элементов,
// выведите любое.

import 'dart:io';

void main() {
  var input = File('bin/coderun/easy/add_minuses/input.txt').readAsLinesSync();
  String n = input[0];

  List<String> bestResult = [];

  void findBestSplit(int index, List<String> currentResult, Set<String> usedNumbers) {
    if (index == n.length) {
      if (currentResult.length > bestResult.length) {
        bestResult = List.from(currentResult);
      }
      return;
    }

    for (int i = index + 1; i <= n.length; i++) {
      String part = n.substring(index, i);
      if (part.startsWith('0') && part.length > 1) continue;
      if (!usedNumbers.contains(part)) {
        currentResult.add(part);
        usedNumbers.add(part);
        findBestSplit(i, currentResult, usedNumbers);
        currentResult.removeLast();
        usedNumbers.remove(part);
      }
    }
  }

  findBestSplit(0, [], {});

  if (bestResult.isEmpty) {
    bestResult.add(n);
  }

  print(bestResult.join('-'));
}

/// Для Coderun
/// 
// import 'dart:io';

// void main() {
//   var reader = stdin;
//   var writer = stdout;

//   String n = reader.readLineSync()!;

//   List<String> bestResult = [];
  
//   void findBestSplit(int index, List<String> currentResult, Set<String> usedNumbers) {
//     if (index == n.length) {
//       if (currentResult.length > bestResult.length) {
//         bestResult = List.from(currentResult);
//       }
//       return;
//     }

//     for (int i = index + 1; i <= n.length; i++) {
//       String part = n.substring(index, i);
//       if (part.startsWith('0') && part.length > 1) continue;
//       if (!usedNumbers.contains(part)) {
//         currentResult.add(part);
//         usedNumbers.add(part);
//         findBestSplit(i, currentResult, usedNumbers);
//         currentResult.removeLast();
//         usedNumbers.remove(part);
//       }
//     }
//   }

//   findBestSplit(0, [], {});

//   if (bestResult.isEmpty) {
//     bestResult.add(n);
//   }

//   writer.writeln(bestResult.join('-'));
// }

