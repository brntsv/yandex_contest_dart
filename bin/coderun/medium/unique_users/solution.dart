import 'dart:io';

void main() {
  List<String> lines =
      File('bin/coderun/medium/unique_users/input.txt').readAsLinesSync();
  int n = int.parse(lines[0]);
  Map<String, int> hash = {};
  for (int i = 0; n > i; i++) {
    String user = lines[i + 1];
    List<String> login = [];
    int l = 0, r = user.length - 1;
    while (user[l] != '@') {
      if (user[l] == '.') {
        l++;
      } else if (user[l] == '-') {
        break;
      } else {
        login.add(user[l]);
        l++;
      }
    }
    List<String> domen = [];
    int k = 0;
    while (user[r] != '@') {
      if (user[r] == '.' && k == 0) {
        k++;
      } else if (k == 0) {
        r--;
      } else {
        domen.insert(0, user[r]);
        r--;
      }
    }
    login.addAll(domen);
    hash.update(login.join(''), (value) => value + 1, ifAbsent: () => 1);
  }
  print(hash.length);
}
