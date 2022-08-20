import 'dart:io';

import 'dart:math';
class MyGame{
  int answer = 0; //field
  int  count = 0;
  int ans = 0;
  MyGame({int maxRandom = 100}){
    var r = Random();
    answer = r.nextInt(maxRandom) + 1; //
    print(' Answer is $answer');
  }
  int getguess(int number_guess){
    count += 1;
    if(number_guess > answer){
      print('║   ➜ $number_guess is TOO HIGH! ▲');
      print('╟───────────────────────────────────────────────────');
      return 0;
    }
    else if(number_guess < answer){
      print('║   ➜ $number_guess is TOO LOW! ▼');
      print('╟───────────────────────────────────────────────────');
      return 0;
    }
    else{
      print("║ ➜ $number_guess is correct ✔, total guesses: $count");
      return 3;
    }
  }
}

void main() {
  int check = 0;
  int c = 0;
  int list1 = 0;
  List<int> myList = [];
  while (check == 0 && c == 0) {
    list1 += 1;
    int result = 0;
    stdout.write(" Enter a maximum number to  random : ");
    var input = stdin.readLineSync();
    var type = int.tryParse(input!);
    if (type == null) {
      print('╔═══════════════════════════════════════════════════');
      print('║                   PLEASE ENTER NUMBER');
      print('╟───────────────────────────────────────────────────');
      continue;
    }
    var game = MyGame(maxRandom: 100);
    print('╔═══════════════════════════════════════════════════');
    print('║                   GUESS THE NUMBER');
    print('╟───────────────────────────────────────────────────');

    do {
      stdout.write("║ Guess the number between 1 and $type : ");
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);
      if (guess == null) {
        print('║ Plsease enter number only');
        continue;
      }
      result = game.getguess(guess);
      if (result == 3) {
        check = 1;
      }
    }
    while (result != 3 && c == 0);
    myList.add(game.count);
    print('╟───────────────────────────────────────────────────');
    print('║                   THE END');
    print('╚═══════════════════════════════════════════════════');
    stdout.write(" ⌚⌚ Select (Yes/No) to play next round : ");
    for(;;){
      var playagin = stdin.readLineSync();
      if (playagin == "Yes" || playagin == 'yes') {
        check = 0;
        c = 0;
        break;
      }
      else if (playagin == "No" || playagin == 'no') {
        c += 1;
        print("  You've played $c games");
        for(int i = 0; i < myList.length ; i++){
          int n = myList[i];
          int j = i + 1;
          print(" 🎮🎮🎮  Game #$j: $n guesses");
        }
        break;
      }
      else {
        stdout.write(" ⌚⌚ Select (Yes/No) to play next round : ");
        continue;
      }
    }
  }
}