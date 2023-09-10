import 'dart:io';

void main() {
  List<String> lines =
      File('bin/coderun/easy/neightbor_parity/input.txt').readAsLinesSync();
  int n = int.parse(lines[0]);
  List<int> a = lines[1].split(' ').map(int.parse).toList();
  List<int> evens = [];
  List<int> odds = [];
  for (int number in a) {
    if (number.isEven) {
      evens.add(number);
    } else {
      odds.add(number);
    }
  }
  List<bool> changed = List.filled(n, false);
  int l = 0, r = n - 1, count = 0;
  if (odds.length == evens.length) {
    List<int> b = List.from(a);
    int countA = 0, countB = 0;
    evens = [];
    odds = [];
    while (l < r) {
      if (l.isEven) {
        if (a[l].isOdd && a[r].isEven) {
          changed[l] = true;
          changed[r] = true;
          l++;
          r--;
        } else if (a[l].isEven && a[r].isOdd) {
          int tmp = a[l];
          a[l] = a[r];
          a[r] = tmp;
          changed[l] = true;
          changed[r] = true;
          l++;
          r--;
          countA += 2;
        } else if (a[l].isOdd && a[r].isOdd) {
          odds.add(a[r]);
          if (evens.isNotEmpty) {
            a[r] = evens.removeLast();
            changed[r] = true;
            countA++;
          }
          changed[l] = true;
          l++;
          r--;
        } else if (a[l].isEven && a[r].isEven) {
          evens.add(a[l]);
          if (odds.isNotEmpty) {
            a[l] = odds.removeLast();
            changed[l] = true;
            countA++;
          }
          changed[r] = true;
          l++;
          r--;
        }
      } else {
        if (a[l].isEven && a[r].isOdd) {
          changed[l] = true;
          changed[r] = true;
          l++;
          r--;
        } else if (a[l].isOdd && a[r].isEven) {
          int tmp = a[l];
          a[l] = a[r];
          a[r] = tmp;
          changed[l] = true;
          changed[r] = true;
          l++;
          r--;
          countA += 2;
        } else if (a[l].isEven && a[r].isEven) {
          evens.add(a[r]);
          if (odds.isNotEmpty) {
            a[r] = odds.removeLast();
            changed[r] = true;
            countA++;
          }
          changed[l] = true;
          l++;
          r--;
        } else if (a[l].isOdd && a[r].isOdd) {
          odds.add(a[l]);
          if (evens.isNotEmpty) {
            a[l] = evens.removeLast();
            changed[l] = true;
            countA++;
          }
          changed[r] = true;
          l++;
          r--;
        }
      }
    }

    for (int i = 0; n > i; i++) {
      if (changed[i] == false) {
        if (i.isOdd) {
          if (evens.isNotEmpty) {
            a[i] = evens.removeLast();
            countA++;
          }
        } else {
          if (odds.isNotEmpty) {
            a[i] = odds.removeLast();
            countA++;
          }
        }
        changed[i] = true;
      }
    }

    evens = [];
    odds = [];
    changed = List.filled(n, false);
    l = 0; r = n - 1; 
    while (l < r) {
      if (l.isEven) {
        if (b[l].isEven && b[r].isOdd) {
          changed[l] = true;
          changed[r] = true;
          l++;
          r--;
        } else if (b[l].isOdd && b[r].isEven) {
          int tmp = b[l];
          b[l] = b[r];
          b[r] = tmp;
          changed[l] = true;
          changed[r] = true;
          l++;
          r--;
          countB += 2;
        } else if (b[l].isOdd && b[r].isOdd) {
          odds.add(b[l]);
          if (evens.isNotEmpty) {
            b[l] = evens.removeLast();
            changed[l] = true;
            countB++;
          }
          changed[r] = true;
          l++;
          r--;
        } else if (b[l].isEven && b[r].isEven) {
          evens.add(b[r]);
          if (odds.isNotEmpty) {
            b[r] = odds.removeLast();
            changed[r] = true;
            countB++;
          }
          changed[l] = true;
          l++;
          r--;
        }
      } else {
        if (b[l].isOdd && b[r].isEven) {
          changed[l] = true;
          changed[r] = true;
          l++;
          r--;
        } else if (b[l].isEven && b[r].isOdd) {
          int tmp = b[l];
          b[l] = b[r];
          b[r] = tmp;
          changed[l] = true;
          changed[r] = true;
          l++;
          r--;
          countB += 2;
        } else if (b[l].isEven && b[r].isEven) {
          evens.add(b[l]);
          if (odds.isNotEmpty) {
            b[l] = odds.removeLast();
            changed[l] = true;
            countB++;
          }
          changed[r] = true;
          l++;
          r--;
        } else if (b[l].isOdd && b[r].isOdd) {
          odds.add(b[r]);
          if (evens.isNotEmpty) {
            b[r] = evens.removeLast();
            changed[r] = true;
            countB++;
          }
          changed[l] = true;
          l++;
          r--;
        }
      }
    }

    for (int i = 0; n > i; i++) {
      if (changed[i] == false) {
        if (i.isEven) {
          if (evens.isNotEmpty) {
            b[i] = evens.removeLast();
            countB++;
          }
        } else {
          if (odds.isNotEmpty) {
            b[i] = odds.removeLast();
            countB++;
          }
        }
        changed[i] = true;
      }
    }
    if (countA < countB) {
      print(countA);
      print(a.join(' '));
    } else {
      print(countB);
      print(b.join(' '));
    }
    return;
  } else if (odds.length == evens.length + 1) {
    evens = [];
    odds = [];
    while (l <= r) {
      if (l.isEven) {
        if (l == r) {
          if (a[l].isEven) {
            evens.add(a[l]);
            if (odds.isNotEmpty) {
              a[l] = odds.removeLast();
              count++;
            }
          }
          changed[l] = true;
          break;
        }
        if (a[l].isOdd && a[r].isOdd) {
          changed[l] = true;
          changed[r] = true;
          l++;
          r--;
        } else if (a[l].isEven && a[r].isEven) {
          evens.addAll([a[l], a[r]]);
          if (odds.isNotEmpty) {
            a[l] = odds.removeLast();
            changed[l] = true;
            count++;
          }
          if (odds.isNotEmpty) {
            a[r] = odds.removeLast();
            changed[r] = true;
            count++;
          }
          l++;
          r--;
        } else if (a[l].isOdd && a[r].isEven) {
          evens.add(a[r]);
          if (odds.isNotEmpty) {
            a[r] = odds.removeLast();
            changed[r] = true;
            count++;
          }
          changed[l] = true;
          l++;
          r--;
        } else if (a[l].isEven && a[r].isOdd) {
          evens.add(a[l]);
          if (odds.isNotEmpty) {
            a[l] = odds.removeLast();
            changed[l] = true;
            count++;
          }
          changed[r] = true;
          l++;
          r--;
        }
      } else {
        if (l == r) {
          if (a[l].isOdd) {
            odds.add(a[l]);
            if (evens.isNotEmpty) {
              a[l] = evens.removeLast();
              count++;
            }
          }
          changed[l] = true;
          break;
        }
        if (a[l].isEven && a[r].isEven) {
          changed[l] = true;
          changed[r] = true;
          l++;
          r--;
        } else if (a[l].isOdd && a[r].isOdd) {
          odds.addAll([a[l], a[r]]);
          if (evens.isNotEmpty) {
            a[l] = evens.removeLast();
            changed[l] = true;
            count++;
          }
          if (evens.isNotEmpty) {
            a[r] = evens.removeLast();
            changed[r] = true;
            count++;
          }
          l++;
          r--;
        } else if (a[l].isOdd && a[r].isEven) {
          odds.add(a[l]);
          if (evens.isNotEmpty) {
            a[l] = evens.removeLast();
            changed[l] = true;
            count++;
          }
          changed[r] = true;
          l++;
          r--;
        } else if (a[l].isEven && a[r].isOdd) {
          odds.add(a[r]);
          if (evens.isNotEmpty) {
            a[r] = evens.removeLast();
            changed[r] = true;
            count++;
          }
          changed[l] = true;
          l++;
          r--;
        }
      }
    }
    for (int i = 0; n > i; i++) {
      if (changed[i] == false) {
        if (i.isOdd) {
          if (evens.isNotEmpty) {
            a[i] = evens.removeLast();
            count++;
          }
        } else {
          if (odds.isNotEmpty) {
            a[i] = odds.removeLast();
            count++;
          }
        }
        changed[i] = true;
      }
    }
    print(count);
    print(a.join(' '));
    return;
  } else if (evens.length == odds.length + 1) {
    evens = [];
    odds = [];
    while (l <= r) {
      if (l.isEven) {
        if (l == r) {
          if (a[l].isOdd) {
            odds.add(a[l]);
            if (evens.isNotEmpty) {
              a[l] = evens.removeLast();
              count++;
            }
          }
          changed[l] = true;
          break;
        }
        if (a[l].isEven && a[r].isEven) {
          changed[l] = true;
          changed[r] = true;
          l++;
          r--;
        } else if (a[l].isOdd && a[r].isOdd) {
          odds.addAll([a[l], a[r]]);
          if (evens.isNotEmpty) {
            a[l] = evens.removeLast();
            changed[l] = true;
            count++;
          }
          if (evens.isNotEmpty) {
            a[r] = evens.removeLast();
            changed[r] = true;
            count++;
          }
          l++;
          r--;
        } else if (a[l].isOdd && a[r].isEven) {
          odds.add(a[l]);
          if (evens.isNotEmpty) {
            a[l] = evens.removeLast();
            changed[l] = true;
            count++;
          }
          changed[r] = true;
          l++;
          r--;
        } else if (a[l].isEven && a[r].isOdd) {
          odds.add(a[r]);
          if (evens.isNotEmpty) {
            a[r] = evens.removeLast();
            changed[r] = true;
            count++;
          }
          changed[l] = true;
          l++;
          r--;
        }
      } else {
        if (l == r) {
          if (a[l].isEven) {
            evens.add(a[l]);
            if (odds.isNotEmpty) {
              a[l] = odds.removeLast();
              count++;
            }
          }
          changed[l] = true;
          break;
        }
        if (a[l].isOdd && a[r].isOdd) {
          changed[l] = true;
          changed[r] = true;
          l++;
          r--;
        } else if (a[l].isEven && a[r].isEven) {
          evens.addAll([a[l], a[r]]);
          if (odds.isNotEmpty) {
            a[l] = odds.removeLast();
            changed[l] = true;
            count++;
          }
          if (odds.isNotEmpty) {
            a[r] = odds.removeLast();
            changed[r] = true;
            count++;
          }
          l++;
          r--;
        } else if (a[l].isOdd && a[r].isEven) {
          evens.add(a[r]);
          if (odds.isNotEmpty) {
            a[r] = odds.removeLast();
            changed[r] = true;
            count++;
          }
          changed[l] = true;
          l++;
          r--;
        } else if (a[l].isEven && a[r].isOdd) {
          evens.add(a[l]);
          if (odds.isNotEmpty) {
            a[l] = odds.removeLast();
            changed[l] = true;
            count++;
          }
          changed[r] = true;
          l++;
          r--;
        }
      }
    }
    for (int i = 0; n > i; i++) {
      if (changed[i] == false) {
        if (i.isEven) {
          if (evens.isNotEmpty) {
            a[i] = evens.removeLast();
            count++;
          }
        } else {
          if (odds.isNotEmpty) {
            a[i] = odds.removeLast();
            count++;
          }
        }
        changed[i] = true;
      }
    }
    print(count);
    print(a.join(' '));
    return;
  } else {
    print('-1');
    return;
  }
}
