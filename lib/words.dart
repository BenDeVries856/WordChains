
import 'dart:convert';
import 'dart:math';

import 'package:flutter/services.dart';

enum Difficulty {
  easy,
  medium,
  hard,
  marathon,
  free
}

class Words {

  List<String> allWords = <String>[];
  List<String> shortWords = <String>[];
  List<String> threeLetters = <String>[];
  List<String> fourLetters = <String>[];
  List<String> fiveLetters = <String>[];
  List<String> sixLetters = <String>[];
  List<String> longWords = <String>[];

  bool isWord(String word){
    if(word.length <= 2){
      return shortWords.contains(word);
    }else if(word.length == 3){
      return threeLetters.contains(word);
    }else if(word.length == 4){
      return fourLetters.contains(word);
    }else if(word.length == 5){
      return fiveLetters.contains(word);
    }else if(word.length == 6){
      return sixLetters.contains(word);
    }else{
      return longWords.contains(word);
    }
  }

  // gets a random word of 4, 5, or 6 letters length
  String getRandomWord(){
    if(allWords.isNotEmpty){
      final random = Random();
      int list = 4 + Random().nextInt(7 - 4);
      if(list == 4){
        return fourLetters[random.nextInt(fourLetters.length)];
      }else if(list == 6){
        return sixLetters[random.nextInt(sixLetters.length)];
      }
      return fiveLetters[random.nextInt(fiveLetters.length)];
    }else{
      return '';
    }
  }

  String getRandomWordOfLength(int length){
    // TODO doesnt work for words shorter than 3, or longer than 6 letters
    final random = Random();
    if (length <= 2) {
      return shortWords[random.nextInt(shortWords.length)];
    } else if (length == 3) {
      return threeLetters[random.nextInt(threeLetters.length)];
    } else if (length == 4) {
      return fourLetters[random.nextInt(fourLetters.length)];
    } else if (length == 5) {
      return fiveLetters[random.nextInt(fiveLetters.length)];
    } else if (length == 6) {
      return sixLetters[random.nextInt(sixLetters.length)];
    } else {
      return longWords[random.nextInt(longWords.length)];
    }
  }

  String getTarget(String start, int steps){
    List<String> wordOrder = generateTarget(start, steps);
    //print(''); for(String word in wordOrder){print(word);};
    return wordOrder[wordOrder.length-1];
  }

  List<String> generateTarget(String start, int steps){
    List<String> wordOrder = <String>[];
    wordOrder.add(start);

    final random = Random();
    var alphabet = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'];
    String target = start;
    var previousSteps = [target];

    for(var i = 0; i < steps; i++){
      List<String> possibleTargets = <String>[];

      // find words by adding letters
      for(var j = 0; j < target.length; j++){
        for (var letter in alphabet){
          String word = target.substring(0, j) + letter + target.substring(j);
          if (isWord(word) && word != target && !previousSteps.contains(word)) {
            possibleTargets.add(word);
          }
        }
      }
      // adding a letter on the end
      for (var letter in alphabet){
        String word = target + letter;
        if (isWord(word) && word != target && !previousSteps.contains(word)) {
          possibleTargets.add(word);
        }
      }

      // find words by removing letters
      for(var j = 0; j < target.length; j++){
        String word = target.substring(0, j) + target.substring(j + 1);
        if (isWord(word) && word != target && !previousSteps.contains(word)) {
          possibleTargets.add(word);
        }
      }

      // find words by changing letters
      for(var j = 0; j < target.length; j++){
        for(var letter in alphabet){
          String word = target.substring(0, j) + letter + target.substring(j + 1);
          if (isWord(word) && word != target && !previousSteps.contains(word)) {
            possibleTargets.add(word);
          }
        }
      }

      // pick any of the possible next steps randomly
      //print(''); print('word: $target'); print('possible targets:'); for(String t in possibleTargets){print(t);}
      if(possibleTargets.isNotEmpty) {
        String nextWord = possibleTargets[random.nextInt(possibleTargets.length)];
        previousSteps.add(nextWord);
        previousSteps = previousSteps + possibleTargets;
        wordOrder.add(nextWord);
        possibleTargets.clear();
        target = nextWord;
      }
    }
    return wordOrder;
  }

  void generateList(var startDate, int length, int minWordLength, int maxWordLength, int minSteps, int maxSteps){
    int counter = length;
    int steps = minSteps + Random().nextInt(maxSteps + 1 - minSteps);
    int wordLength = minWordLength + Random().nextInt(maxWordLength + 1 - minWordLength);
    int dayIncrement = 0;
    while(counter > 0){
      List<String> chain = generateTarget(getRandomWordOfLength(wordLength), steps);
      if(chain.length-1 == steps){
        var newDate = DateTime(startDate.year, startDate.month, startDate.day + dayIncrement);
        String line = '["${newDate.toString().substring(0, newDate.toString().length - 13)}", ';
        for(String word in chain) {
          line += '"$word", ';
        }
        line += '],';
        print(line);
        dayIncrement++;
        counter--;
        steps = minSteps + Random().nextInt(maxSteps + 1 - minSteps);
        wordLength = minWordLength + Random().nextInt(maxWordLength + 1 - minWordLength);
      }
    }
  }

  void generateListByDifficulty(var startDate, int length, Difficulty difficulty){
    if(difficulty == Difficulty.easy) {
      // word length: 3 to 4 letters long
      // number of steps: 3 to 4
      generateList(startDate, length, 3, 4, 3, 4);
    }else if(difficulty == Difficulty.medium){
      // word length: 3 to 6 letters long
      // number of steps: 4 to 6
      generateList(startDate, length, 3, 6, 4, 6);
    }else if(difficulty == Difficulty.hard){
      // word length: 5 to 6 letters long
      // number of steps: 6 to 8
      generateList(startDate, length, 5, 6, 6, 8);
    }else if(difficulty == Difficulty.marathon){
      // word length: 4 to 5
      // number of steps: 20 to 25
      generateList(startDate, length, 4, 5, 20, 25);
    }
  }

  int getNumberOfLives(Difficulty difficulty){
    if(difficulty == Difficulty.easy){
      return 6;
    }else if(difficulty == Difficulty.medium){
      return 8;
    }else if(difficulty == Difficulty.hard){
      return 8;
    }else if(difficulty == Difficulty.marathon){
      return 32;
    }
    return 10;
  }

  List<String> getChainByDifficulty(Difficulty difficulty){
    int counter = 1;
    int minSteps = 3;
    int maxSteps = 4;
    int minWordLength = 3;
    int maxWordLength = 4;
    if(difficulty == Difficulty.medium){
      minSteps = 4;
      maxSteps = 6;
      minWordLength = 3;
      maxWordLength = 6;
    }else if(difficulty == Difficulty.hard){
      minSteps = 6;
      maxSteps = 8;
      minWordLength = 5;
      maxWordLength = 6;
    }else if(difficulty == Difficulty.marathon){
      minSteps = 20;
      maxSteps = 25;
      minWordLength = 4;
      maxWordLength = 5;
    }
    int maxTrys = 1000;
    int steps = minSteps + Random().nextInt(maxSteps + 1 - minSteps);
    int wordLength = minWordLength + Random().nextInt(maxWordLength + 1 - minWordLength);
    List<String> finalChain = <String>[];
    while(counter > 0 && maxTrys > 0){
      List<String> chain = generateTarget(getRandomWordOfLength(wordLength), steps);
      maxTrys--;
      if(chain.length-1 == steps){
        finalChain = chain;
        counter--;
      }
    }
    return finalChain;
  }

}

Future<Words> loadWords(String file) async {

  Words words = Words();
  String response;
  response = await rootBundle.loadString(file);
  LineSplitter ls = const LineSplitter();

  words.allWords = ls.convert(response);
  for(String word in words.allWords) {
    if (word.length <= 2) {
      words.shortWords.add(word);
    } else if (word.length == 3) {
      words.threeLetters.add(word);
    } else if (word.length == 4) {
      words.fourLetters.add(word);
    } else if (word.length == 5) {
      words.fiveLetters.add(word);
    } else if (word.length == 6) {
      words.sixLetters.add(word);
    } else {
      words.longWords.add(word);
    }
  }

  return words;
}