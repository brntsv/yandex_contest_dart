import 'dart:io';

void main() {
    List<String> lines =
      File('bin/coderun/easy/flight/input.txt').readAsLinesSync();
  List<int> departure = lines[0].split(':').map(int.parse).toList();
  List<int> arrival = lines[1].split(':').map(int.parse).toList();
  int timezoneDiff = int.parse(lines[2]);

  int departureTime = departure[0] * 60 + departure[1];
  int arrivalTime = arrival[0] * 60 + arrival[1];

  int flightTime = (arrivalTime - (departureTime + timezoneDiff * 60) + 24 * 60) % (24 * 60);
  int hours = flightTime ~/ 60;
  int minutes = flightTime % 60;

  print('$hours:${minutes.toString().padLeft(2, '0')}');
}
