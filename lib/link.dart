import 'package:flutter/material.dart';
import 'sizing.dart';

class WordLink extends StatefulWidget {

  TextEditingController controller;
  bool? correctGuess;

  WordLink({required this.controller, super.key});

  @override
  State<WordLink> createState() => _WordLinkState();
}

class _WordLinkState extends State<WordLink> {

  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    Color textColor = Colors.black;
    if(widget.correctGuess != null && widget.correctGuess!){
      textColor = Colors.green;
    }else if(widget.correctGuess != null && !widget.correctGuess!){
      textColor = Colors.red;
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: getTextSize(screenWidth, screenHeight)),
      decoration: BoxDecoration(
          border: Border.all(width: getBorderWidth(screenWidth, screenHeight), color: Colors.black)
      ),
      child: TextField(
        controller: widget.controller,
        maxLength: 8,
        decoration: InputDecoration(
          // TODO hintText: 'Enter Something',
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: getTextSize(screenWidth, screenHeight) / 2),
          counterText: '',
        ),
        style: TextStyle(
          color: textColor,
          fontSize: getTextSizeLarge(screenWidth, screenHeight),
          letterSpacing: getTextSize(screenWidth, screenHeight),
        ),
      ),
    );
  }

}

class WordLabel extends StatefulWidget {

  double availableWidth;
  String text;
  List<String> guesses;
  int guessIndex;

  WordLabel({required this.availableWidth, required this.text, required this.guesses, required this.guessIndex, super.key});

  @override
  State<WordLabel> createState() => _WordLabelState();

}

class _WordLabelState extends State<WordLabel> {

  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double colSize = widget.availableWidth / 8;

    // for determining the borders, each words needs to have as many
    // "boxes / letter labels" as the longest word being displayed
    int len = widget.text.length;
    for(String guess in widget.guesses){
      if(guess.length > len) len = guess.length;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for(var i = 0; i < len; i++)
          Container(
            decoration: BoxDecoration(
                //border: Border.all(color: Colors.black)
              border: determineBorder(i, getBorderWidth(screenWidth, screenHeight)),
            ),
            constraints: BoxConstraints(minWidth: colSize, maxWidth: colSize),
            width: colSize,
            height: colSize,
            child: Center(
              child: Text(
                  textAlign: TextAlign.center,
                  (i < widget.text.length) ? widget.text[i] : ' ',
                  style: TextStyle(
                      fontSize: getTextSizeLarge(screenWidth, screenHeight),
                  )
              ),
            )
          ),
      ],
    );
  }
  
  Border determineBorder(int letterIndex, double width) {
    // special cases
    if(letterIndex >= widget.text.length){
      if(widget.guessIndex != widget.guesses.length-1 && letterIndex < widget.guesses[widget.guessIndex+1].length){
        return Border(bottom: BorderSide(width: width, color: Colors.black));
      }else {
        return const Border();
      }
    }

    // normal border determination
    if(widget.guessIndex == 0){
      if(letterIndex == 0){
        return Border(left: BorderSide(width: width, color: Colors.black), top: BorderSide(width: width, color: Colors.black), right: BorderSide(width: width, color: Colors.black), bottom: BorderSide(width: width, color: Colors.black));
      }else{
        return Border(top: BorderSide(width: width, color: Colors.black), right: BorderSide(width: width, color: Colors.black), bottom: BorderSide(width: width, color: Colors.black));
      }
    }else{
      if(letterIndex == 0){
        return Border(left: BorderSide(width: width, color: Colors.black), right: BorderSide(width: width, color: Colors.black), bottom: BorderSide(width: width, color: Colors.black));
      }else{
        return Border(right: BorderSide(width: width, color: Colors.black), bottom: BorderSide(width: width, color: Colors.black));
      }
    }
  }

}