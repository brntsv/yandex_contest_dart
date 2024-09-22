// Студенты школы мобильных разработчиков создали поисковый движок, который ориентируется на ключевые слова.
// Например, пользователь ищет информацию о гусях, и поисковому движку выдаётся перечень из n статей с названием
// сайта и кратким описанием статьи. Если на сайте в кратком описании статей суммарно не менее k раз упомянуто ключевое
// слово, то, скорее всего, сайт создан для обхода поискового робота и может содержать некачественный контент.
// Учтите, что если ключевое слово является частью другого слова, это не учитывается как отдельное упоминание.
// Робот скрывает такие сайты из поисковой выдачи. Определите количество отфильтрованных сайтов и выведите их названия.

// Формат ввода
// В первой строке содержатся два целых числа: n — количество статей, k — количество упоминаний слова goose для применения
// фильтра (1 ≤ n ≤ 10^5, 0 ≤ k ≤ 10^6).
// В следующих n парах строк содержатся:
// site_i — название сайта: строка, состоящая не более чем из 20 строчных символов английского алфавита;
// message_i — краткое описание статьи: строка, состоящая не более чем из 100 строчных символов английского алфавита и пробелов.

// Все названия сайтов различны. На одном сайте может быть несколько статей.

// Гарантируется, что суммарная длина всех сообщений не превосходит 2×10^6 .

// Формат вывода
// В первой строке выведите n — количество отфильтрованных сайтов. В следующих n строках выведите в алфавитном порядке названия сайтов, скрытых из поиска.

// Примечание
// Рассмотрим Пример 1.

// Всего в запросе
// 2 уникальных сайта:
// Android;
// iOS.
// Рассмотрим краткие описания статей:
// gooseberries are very tasty — 0 упоминаний, так как подстроки не считаются;
// the goose — 1 упоминание;
// goose is the coolest — 1 упоминание.
// Суммарное количество упоминаний для каждого сайта:

// Android: 0 + 1 = 1 — сайт скрывается;
// iOS: 0 + 1 = 1 — сайт скрывается.

import 'dart:io';

void main() {
  var input = File('bin/coderun/easy/push_goose/input.txt').readAsLinesSync();

  List<int> firstLine = input[0].split(' ').map(int.parse).toList();
  int n = firstLine[0];
  int k = firstLine[1];
  Map<String, int> siteGooseCounts = {};

  for (int i = 1; i <= n * 2; i += 2) {
    String site = input[i];
    String message = input[i + 1];

    int gooseCount = countGoose(message);
    siteGooseCounts[site] = (siteGooseCounts[site] ?? 0) + gooseCount;
  }

  List<String> hiddenSites =
      siteGooseCounts.entries.where((entry) => entry.value >= k).map((entry) => entry.key).toList();

  hiddenSites.sort();

  print(hiddenSites.length);
  for (var site in hiddenSites) {
    print(site);
  }
}

int countGoose(String message) {
  List<String> words = message.split(' ');
  return words.where((word) => word == 'goose').length;
}

/// Для Coderun

// import 'dart:io';

// void main() {
//   var reader = stdin;
//   var writer = stdout;

//   // Чтение первой строки с количеством статей и пороговым значением
//   List<int> firstLine = reader.readLineSync()!.split(' ').map(int.parse).toList();
//   int n = firstLine[0];
//   int k = firstLine[1];

//   Map<String, int> siteGooseCounts = {};

//   // Чтение статей и подсчет упоминаний "goose"
//   for (int i = 1; i <= n * 2; i += 2) {
//     String site = reader.readLineSync()!;
//     String message = reader.readLineSync()!;
    
//     int gooseCount = countGoose(message);
//     siteGooseCounts[site] = (siteGooseCounts[site] ?? 0) + gooseCount;
//   }

//   // Фильтрация и сортировка скрытых сайтов
//   List<String> hiddenSites = siteGooseCounts.entries
//       .where((entry) => entry.value >= k)
//       .map((entry) => entry.key)
//       .toList();

//   hiddenSites.sort();

//   // Вывод результатов
//   writer.writeln(hiddenSites.length);
//   for (var site in hiddenSites) {
//     writer.writeln(site);
//   }
// }
