import 'dart:async';
import 'package:flutter/material.dart';
import 'link.dart';
import 'words.dart';
import 'lists.dart';
import 'sizing.dart';

class PlayPage extends StatefulWidget {
  final Map<String, dynamic>? args;

  const PlayPage(this.args, {super.key});

  @override
  State<PlayPage> createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {

  Words? words;
  final _textController = TextEditingController();

  bool winner = false;
  bool loser = false;
  String errorMessage = "";
  List<String> guesses = <String>[];
  int lives = 10;
  int score = 10000;
  String? startWord;
  String? targetWord;
  bool? correctGuess;

  @override
  void initState(){
    super.initState();
    getWords();
  }

  Future<void> getWords() async {
    words = await loadWords('assets/words.txt');
    setState(() {
      if(words != null) {
        List<String> chain = getDailyWordChain(words!, widget.args?["difficulty"]);
        lives = words!.getNumberOfLives(widget.args?["difficulty"]);
        startWord = chain[0];
        targetWord = chain[chain.length-1];
        guesses.add(startWord!);

        // TODO for testing, can be deleted:
        guesses.add(chain[1]);
        //guesses.add(chain[2]);
      }
    });
  }

  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // chrome dimensions (100% zoom): - 500 x 558
    double boxWidth = screenWidth * getBoxWidthPercentage(screenWidth, screenHeight);
    double boxMargin = (screenWidth - boxWidth) / 2;
    double topSpacing = screenHeight * getBoxAboveSpacing(screenWidth, screenHeight);

    if(loser){

      return Scaffold(
          body: Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // You Lose
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                child: Text(
                  'You Lose',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getTextSizeExtraLarge(screenWidth, screenHeight)
                  ),
                ),
              ),

              // label for showing all guesses
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                child: Text(
                  "You ran out of guesses.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getTextSize(screenWidth, screenHeight),
                  )
                ),
              ),

              // button for returning to home page
              Container(
                margin: EdgeInsets.symmetric(vertical: getTextSize(screenWidth, screenHeight)),
                padding: EdgeInsets.symmetric(horizontal: boxMargin),
                constraints: BoxConstraints(minWidth: boxWidth, maxWidth: boxWidth),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/play', arguments: {'difficulty': widget.args?["difficulty"]},);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 10),
                    ),
                    child: Text(
                      'Try Again',
                      style: TextStyle(
                        fontSize: getTextSize(screenWidth, screenHeight)
                      )
                    )
                ),
              ),

            ],
          ),
        ),
      );

    }else if(winner){

      String guessString = guesses[0];
      for(var i = 1; i < guesses.length; i++){
        guessString += ' > ${guesses[i]}';
      }

      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // score label
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                child: Text(
                  'You Win!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getTextSizeExtraLarge(screenWidth, screenHeight)
                  ),
                ),
              ),

              // label for showing all guesses
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                child: Text(
                  guessString,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getTextSize(screenWidth, screenHeight),
                  )
                ),
              ),

              // button for returning to home page
              Container(
                margin: EdgeInsets.symmetric(vertical: getTextSize(screenWidth, screenHeight)),
                padding: EdgeInsets.symmetric(horizontal: boxMargin),
                constraints: BoxConstraints(minWidth: boxWidth, maxWidth: boxWidth),
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 10),
                    ),
                    child: Text(
                      'Return',
                      style: TextStyle(
                        fontSize: getTextSize(screenWidth, screenHeight),
                      )
                    )
                ),
              ),

            ],

          ),
        )
      );

    }else{

      return Scaffold(
        body: ListView(
            children: [

              // spacing
              Container(padding: EdgeInsets.symmetric(vertical: topSpacing)),

              // number of lives display
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                child: Text(
                  'Guesses Left: $lives',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getTextSizeExtraLarge(screenWidth, screenHeight)
                  ),
                ),
              ),

              // start and target words label
              Container(
                margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                child: Row(
                  children: [
                    Expanded(
                        child: Text(
                          'Start: ${(startWord != null) ? startWord! : ''}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: getTextSize(screenWidth, screenHeight),
                              color: const Color(0xff9375d1)
                          ),
                        )
                    ),
                    Expanded(
                        child: Text(
                          'Target: ${(targetWord != null) ? targetWord! : ''}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: getTextSize(screenWidth, screenHeight),
                              color: const Color(0xff9375d1)
                          ),
                        )
                    ),
                  ],
                ),
              ),

              // guesses
              Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.symmetric(horizontal: boxMargin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for(var i = 0; i < guesses.length; i++)
                        WordLabel(
                          availableWidth: boxWidth,
                          text: guesses[i],
                          guesses: guesses,
                          guessIndex: i,
                        ),
                      WordLink(
                          controller: _textController
                      )..correctGuess=correctGuess,
                    ],
                  )
              ),

              // submit button
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: boxMargin),
                child: ElevatedButton(
                    onPressed: (){
                      setState(() {
                        String input = _textController.text;
                        if(input.isNotEmpty){

                          bool validWord = words!.isWord(input);
                          if(validWord && validStep(input, guesses[guesses.length - 1])){
                            // winner !!!
                            if(input == targetWord!) winner = true;
                            guesses.add(input);
                            correctGuess = true;
                            errorMessage = "";
                          }else{
                            if(!validWord) errorMessage = "Not a word.";
                            correctGuess = false;
                          }
                          lives--;

                        }

                        // wait 1 second then reset
                        // wait 1 second before going to next question (then reset button color)
                        final timer = Timer(
                            const Duration(seconds: 1), (){
                          setState((){
                            _textController.text = '';
                            correctGuess = null;
                            errorMessage = "";
                            if(lives <= 0){
                              if(!winner) loser = true;
                            }
                          });
                        }
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 27, horizontal: 10),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: getTextSize(screenWidth, screenHeight)
                      )
                    ),
                ),
              ),

              // label for showing error messages
              /**if(errorMessage.isNotEmpty) ... [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                  child: Text(
                      errorMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.redAccent,
                      )
                  ),
                ),
              ],**/

            ]
        ),
      );

    }

  }

  bool validStep(String word, String lastWord){
    if(word == lastWord){
      errorMessage = "Word already used.";
      return false;
    }
    if(word.length < lastWord.length-1 || word.length > lastWord.length+1){
      errorMessage = "Words must differ by 1 letter.";
      return false;
    }

    // first check to see if word is same as lastWord +/- a letter
    for(var i = 0; i < word.length; i++){
      String temp = word.substring(0, i) + word.substring(i + 1);
      if(temp == lastWord) return true;
    }
    for(var i = 0; i < lastWord.length; i++){
      String temp = lastWord.substring(0, i) + lastWord.substring(i + 1);
      if(temp == word) return true;
    }

    // check to see if word is lastWord with 1 letter changed
    if(word.length == lastWord.length){
      for(var i = 0; i < word.length; i++){
        String temp1 = word.substring(0, i) + word.substring(i + 1);
        String temp2 = lastWord.substring(0, i) + lastWord.substring(i + 1);
        if(temp1 == temp2) return true;
      }
    }

    errorMessage = "Words must differ by 1 letter.";
    return false;
  }

  // if the word is not correct: -500
  // if the word differs by one letter: -200
  // if the word has had one letter added/removed: -200
  // if the word is off by 2 letters: -1000
  // if the word is off by 1 letter plus 1 letter added/removed: -1500
  // if the word is off by 3 letters: -2500
  // anything worse than that - lost game
  //TODO possible implement in future -> void calculateScore(String word, String lastWord, bool isWord)

}