// Стендап-программа
//
// Стендап-комик Иннокентий составил программу из N шуток. Каждую шутку он проверял,
// рассказывая её своей маме и засекая сколько секунд она смеётся. Недавно Иннокентий
// заметил, что его юмор настолько заразителен, что люди смеются над шуткой тем дольше,
// чем дальше она в программе. Более того, время, которое зал смеётся над каждой шуткой,
// можно посчитать как (номер шутки) × (время, которое над этой шуткой смеётся мама).
//
// К сожалению, комик уже не успевает перестроить всю программу. Однако он придумал
// новую шутку и хочет вставить её в программу так, чтобы зал смеялся над всей программой
// как можно дольше. Мама Иннокентия смеялась над новой шуткой K секунд.
//
// Помогите комику понять, на сколько секунд дольше зал будет смеяться над всей
// программой, если он вставит новую шутку в идеальное место.
//
// Формат ввода:
// - Строка 1: K — количество секунд смеха мамы над новой шуткой
// - Строка 2: N — количество шуток в исходной программе
// - Строка 3: N чисел ai — время смеха мамы над i-й шуткой в программе
//
// Ограничения:
// 0 < K < 10^4
// 0 < N < 10^5
// 0 < ai < 10^4
//
// Формат вывода:
// Одно число — количество добавленных секунд смеха при вставке новой шутки в идеальное место.

// Примечание
// Во втором примере над изначальной программой зал смеялся 1 × 1 + 2 × 4 + 3 × 3 = 18 секунд.
// Если добавить шутку, над которой мама комика смеялась 2 секунды на второе место,
// то над новой программой зал будет смеяться 1 × 1 + 2 × 2 + 3 × 4 + 4 × 3 = 29. Таким образом, после
// добавления новой шутки зал будет смеяться над всей программой на 29 − 18 = 11 секунд дольше.

import 'dart:io';

void main() {
  var input = File('bin/coderun/medium/standup_program/input.txt').readAsLinesSync();

  int k = int.parse(input[0]);
  int n = int.parse(input[1]);
  List<int> a = input[2].split(' ').map(int.parse).toList();

  int totalA = 0;
  int prefixSum = 0;

  for (int i = 0; i < n; i++) {
    totalA += a[i];
  }

  int maxIncrease = 0;

  for (int i = 0; i <= n; i++) {
    // Смех от новой шутки
    int newJokeLaugh = k * (i + 1);

    // Дополнительный смех от сдвига существующих шуток
    int shiftLaugh = totalA - prefixSum;

    // Общее увеличение смеха
    int increase = newJokeLaugh + shiftLaugh;

    maxIncrease = maxIncrease > increase ? maxIncrease : increase;

    // Обновляем префиксную сумму для следующей итерации
    if (i < n) {
      prefixSum += a[i];
    }
  }

  print(maxIncrease);
}

/// Для Coderun
/// 
// import 'dart:io';

// void main() {
//   var reader = stdin;
//   var writer = stdout;

//   int k = int.parse(reader.readLineSync()!);
//   int n = int.parse(reader.readLineSync()!);
//   List<int> a = reader.readLineSync()!.split(' ').map(int.parse).toList();

//   int totalA = 0;
//   int prefixSum = 0;

//   for (int i = 0; i < n; i++) {
//     totalA += a[i];
//   }

//   int maxIncrease = 0;

//   for (int i = 0; i <= n; i++) {
//     int newJokeLaugh = k * (i + 1);
//     int shiftLaugh = totalA - prefixSum;
//     int increase = newJokeLaugh + shiftLaugh;
    
//     maxIncrease = maxIncrease > increase ? maxIncrease : increase;

//     if (i < n) {
//       prefixSum += a[i];
//     }
//   }

//   writer.writeln(maxIncrease);
// }
