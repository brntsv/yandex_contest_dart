import 'dart:io';

void main() {
  List<String> lines =
      File('bin/coderun/easy/resettlement_of_athletes/input.txt')
          .readAsLinesSync();
  int n = int.parse(lines[0]);
  List<int> teams = lines[1].split(' ').map(int.parse).toList();
  int k = int.parse(lines[2]);
  List<List<int>> rooms = [];
  for (int i = 3; i < k + 3; i++) {
    rooms.add(lines[i].split(' ').map(int.parse).toList());
  }

  // Сортируем команды по возрастанию числа спортсменок в них
  teams.sort();

  // Сортируем комнаты по возрастанию вместимости
  rooms.sort((a, b) => a[0].compareTo(b[0]));

  int i = 0; // Индекс текущей команды
  for (var room in rooms) {
    int capacity = room[0]; // Вместимость текущей комнаты
    int count = room[1]; // Количество комнат с такой вместимостью
    // Заселяем команды по порядку, пока это возможно
    while (i < n && teams[i] <= capacity && count > 0) {
      count--;
      i++;
    }
    // Если заселили все команды, выходим из цикла
    if (i >= n) break;
  }

  // Если все команды заселили, выводим Yes, иначе - No
  if (i >= n) {
    print('Yes');
  } else {
    print('No');
  }
}
