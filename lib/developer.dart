import 'package:flutter/material.dart';
import 'link.dart';
import 'words.dart';

class DeveloperPage extends StatefulWidget {
  const DeveloperPage({super.key});

  @override
  State<DeveloperPage> createState() => _DeveloperPageState();
}

class _DeveloperPageState extends State<DeveloperPage> {

  Words? words;
  String? startWord;
  String? targetWord;

  @override
  void initState(){
    super.initState();
    getWords();
  }

  Future<void> getWords() async {
    words = await loadWords('assets/simplewords.txt');
    setState(() {});
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ListView(
          children: [
            if (words != null) ... [
              DevButton(words: words!, text: 'Generate Easy List', difficulty: Difficulty.easy),
              DevButton(words: words!, text: 'Generate Medium List', difficulty: Difficulty.medium),
              DevButton(words: words!, text: 'Generate Hard List', difficulty: Difficulty.hard),
              DevButton(words: words!, text: 'Generate Marathon List', difficulty: Difficulty.marathon),
            ],
          ]
      ),
    );
  }

}

class DevButton extends StatefulWidget {

  Words words;
  String text;
  Difficulty difficulty;

  DevButton({required this.words, required this.text, required this.difficulty, super.key});

  @override
  State<DevButton> createState() => _DevButtonState();
}

class _DevButtonState extends State<DevButton> {

  @override
  Widget build(BuildContext context){
    Words w = widget.words;
    Difficulty d = widget.difficulty;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ElevatedButton(
        onPressed: (){
          if(w != null) {
            int numChains = 40;
            if(d == Difficulty.medium) numChains = 30;
            if(d == Difficulty.hard) numChains = 20;
            if(d == Difficulty.marathon) numChains = 5;
            w.generateListByDifficulty(DateTime.parse("2024-09-04"), numChains, d);
            //w.generateList(10, 3, 4, 4, 5);
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            widget.text,
            style: const TextStyle(
                fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

}