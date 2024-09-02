import 'package:flutter/material.dart';
import 'words.dart';
import 'sizing.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = (screenWidth - (getHomePageWidth(screenWidth, screenHeight) * screenWidth)) / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Word Chains",
          style: TextStyle(
            color: Colors.white,
            fontSize: getTextSize(screenWidth, screenHeight) + 2,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff79708C),
        iconTheme: const IconThemeData(color: Colors.white,),
      ),
      body: ListView(
        children: [

          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Text(
              'Daily Challenges:',
              style: TextStyle(
                fontSize: getTextSize(screenWidth, screenHeight) + 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          HomePageButton(color: Colors.green, text: "Easy", difficulty: Difficulty.easy),
          HomePageButton(color: Colors.orangeAccent, text: "Medium", difficulty: Difficulty.medium),
          HomePageButton(color: Colors.redAccent, text: "Hard", difficulty: Difficulty.hard),
          HomePageButton(color: const Color(0xff9375d1), text: "Marathon", difficulty: Difficulty.marathon),

          const Text(''),
          Text(
            'New challenges every day.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getTextSize(screenWidth, screenHeight),
            )
          )

          /**
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: const Text(
              'Free Play:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          HomePageButton(color: const Color(0xff9375d1), text: "Free Play", difficulty: Difficulty.free),
          **/

        ],
      )
    );
  }

}

class HomePageButton extends StatefulWidget {

  Color color;
  String text;
  Difficulty difficulty;

  HomePageButton({required this.color, required this.text, required this.difficulty, super.key});

  @override
  State<HomePageButton> createState() => _HomePageButtonState();
}

class _HomePageButtonState extends State<HomePageButton> {

  @override
  Widget build(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double padding = (screenWidth - (getHomePageWidth(screenWidth, screenHeight) * screenWidth)) / 2;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: ElevatedButton(
        onPressed: (){
          Navigator.pushNamed(
            context,
            '/play',
            arguments: {'difficulty': widget.difficulty},
          );
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            widget.text,
            style: TextStyle(
                fontSize: getTextSize(screenWidth, screenHeight),
                color: widget.color
            ),
          ),
        ),
      ),
    );
  }

}