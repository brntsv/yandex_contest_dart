// На кольцевой улице города живут n пёсиков. Их дома нумеруются по часовой стрелке.
// Новый закон обязывает каждого пёсика получить ошейник.
// Для ускорения раздачи ошейники решили развезти на машине по кольцевой улице.
// Ошейники можно доставать только по очереди, машина не поедет на второй круг,
// она едет только по часовой стрелке. При этом машина может начать объезд из любой
// точки улицы.
// Если радиус ошейника меньше радиуса шеи пёсика, то ему разрешается не носить ошейник,
// неудовлетворённость пёсика равна 0. Если радиус ошейника больше радиуса шеи не более
// чем на 100 см, то неудовлетворённость пёсика равна разнице радиусов, разделённая
// на два (округлённая вниз). В других случаях ошейник болтается, пёсику неудобно,
// так что его неудовлетворённость равна 30.

// Ошейники уже запакованы в машину, а вы знаете радиусы шеи пёсиков. Нужно так
// выбрать место для начала объезда, чтобы суммарная неудовлетворённость была
// минимальна.

// Формат ввода
// В первой строке дано целое число n(1 ≤ n ≤ 2000) — количество пёсиков и ошейников.
// Во второй строке дано n целых чисел ai(1 ≤ ai ≤ 1000000) — радиус шеи пёсика,
// живущего в i-м доме.
// В третей строке дано n целых чисел bi(1 ≤ bi ≤1000000) — радиус i-го ошейника.

// Формат вывода
// В единственной строке выведите два числа: с какого дома надо начать объезд,
// и минимальную суммарную неудовлетворенность. Если существует несколько оптимальных
// вариантов, выведите тот, в котором номер стартового дома минимален.

import 'dart:io';

void main() {
  var input = File('bin/coderun/easy/dog_collars/input.txt').readAsLinesSync();

  // Чтение входных данных
  int n = int.parse(input[0]);
  List<int> neckSizes = input[1].split(' ').map(int.parse).toList();
  List<int> collarSizes = input[2].split(' ').map(int.parse).toList();

  // Функция для вычисления неудовлетворенности
  int calculateDissatisfaction(int neckSize, int collarSize) {
    if (collarSize < neckSize) return 0;
    if (collarSize - neckSize <= 100) return (collarSize - neckSize) ~/ 2;
    return 30;
  }

  // Вычисление суммарной неудовлетворенности для каждого начального дома
  int minDissatisfaction = 1000000000;
  int bestStartHouse = 1;

  for (int startHouse = 0; startHouse < n; startHouse++) {
    int totalDissatisfaction = 0;
    for (int i = 0; i < n; i++) {
      int houseIndex = (startHouse + i) % n;
      totalDissatisfaction += calculateDissatisfaction(neckSizes[houseIndex], collarSizes[i]);
    }
    if (totalDissatisfaction < minDissatisfaction) {
      minDissatisfaction = totalDissatisfaction;
      bestStartHouse = startHouse + 1; // +1 потому что нумерация домов начинается с 1
    }
  }

  // Вывод результата
  print('$bestStartHouse $minDissatisfaction');
}


/// Для Coderun
// import 'dart:io';

// void main() {
//   var reader = stdin;
//   var writer = stdout;

//   // Чтение входных данных
//   int n = int.parse(reader.readLineSync()!);
//   List<int> neckSizes = reader.readLineSync()!.split(' ').map(int.parse).toList();
//   List<int> collarSizes = reader.readLineSync()!.split(' ').map(int.parse).toList();

//   // Функция для вычисления неудовлетворенности
//   int calculateDissatisfaction(int neckSize, int collarSize) {
//     if (collarSize < neckSize) return 0;
//     if (collarSize - neckSize <= 100) return (collarSize - neckSize) ~/ 2;
//     return 30;
//   }

//   // Вычисление суммарной неудовлетворенности для каждого начального дома
//   int minDissatisfaction = 1000000000;
//   int bestStartHouse = 1;

//   for (int startHouse = 0; startHouse < n; startHouse++) {
//     int totalDissatisfaction = 0;
//     for (int i = 0; i < n; i++) {
//       int houseIndex = (startHouse + i) % n;
//       totalDissatisfaction += calculateDissatisfaction(neckSizes[houseIndex], collarSizes[i]);
//     }
//     if (totalDissatisfaction < minDissatisfaction) {
//       minDissatisfaction = totalDissatisfaction;
//       bestStartHouse = startHouse + 1; // +1 потому что нумерация домов начинается с 1
//     }
//   }

//   // Вывод результата
//   writer.writeln('$bestStartHouse $minDissatisfaction');
// }