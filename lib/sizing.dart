import 'dart:math';

///    Screen Sizes by chrome emulator zoom
///    100% ->   510 x 565 - phone
///    90% ->   566 x 628 - phone
///    80% ->   637 x 706 - (loosely a phone)
///    75% ->   680 x 754 - (loosely a tablet)
///    67% ->   765 x 848 - tablet
///    50% -> 1020 x 1130 - tablet
///
///    height < 637 -> phone
///    height > 680 -> tablet
///
///   phone -> 360 x 712
///   tablet -> 800 x 1285

// font size of text
double getTextSize(double screenWidth, double screenHeight){
  double size = 16;
  if(screenWidth < 515 || screenHeight < 570){
    size = 16;
  }else if(screenWidth < 570 || screenHeight < 650){
    size = 16;
  }else if(screenWidth < 640 || screenHeight < 710){
    size = 18;
  }else if(screenWidth < 690 || screenHeight < 760){
    size = 19;
  }else if(screenWidth < 770 || screenHeight < 850){
    size = 22;
  }else{
    size = 26;
  }
  return size;
}

// font size of larger text
double getTextSizeLarge(double screenWidth, double screenHeight){
  double size = 24;
  if(screenWidth < 515 || screenHeight < 570){
    size = 24;
  }else if(screenWidth < 570 || screenHeight < 650){
    size = 24;
  }else if(screenWidth < 640 || screenHeight < 710){
    size = 26;
  }else if(screenWidth < 690 || screenHeight < 760){
    size = 27;
  }else if(screenWidth < 770 || screenHeight < 850){
    size = 30;
  }else{
    size = 32;
  }
  return size;
}

// font size of larger text
double getTextSizeExtraLarge(double screenWidth, double screenHeight){
  double size = 32;
  if(screenWidth < 515 || screenHeight < 570){
    size = 32;
  }else if(screenWidth < 570 || screenHeight < 650){
    size = 32;
  }else if(screenWidth < 640 || screenHeight < 710){
    size = 34;
  }else if(screenWidth < 690 || screenHeight < 760){
    size = 36;
  }else if(screenWidth < 770 || screenHeight < 850){
    size = 40;
  }else{
    size = 44;
  }
  return size;
}

// the width of the buttons on the home page as a percentage of width
double getHomePageWidth(double screenWidth, double screenHeight){
  double size = 1;
  if(screenWidth < 515 || screenHeight < 570){
    size = 1;
  }else if(screenWidth < 570 || screenHeight < 650){
    size = 1;
  }else if(screenWidth < 640 || screenHeight < 710){
    size = 1;
  }else if(screenWidth < 690 || screenHeight < 760){
    size = 1;
  }else if(screenWidth < 770 || screenHeight < 850){
    size = 0.9;
  }else{
    size = 0.8;
  }
  return size;
}

// the width of the box containing the content on play.dart as a percentage of screen width
double getBoxWidthPercentage(double screenWidth, double screenHeight){
  double size = 0.8;
  if(screenWidth < 515 || screenHeight < 570){
    size = 0.8;
  }else if(screenWidth < 570 || screenHeight < 650){
    size = 0.8;
  }else if(screenWidth < 640 || screenHeight < 710){
    size = 0.8;
  }else if(screenWidth < 690 || screenHeight < 760){
    size = 0.8;
  }else if(screenWidth < 770 || screenHeight < 850){
    size = 0.7;
  }else{
    size = 0.6;
  }
  return size;
}

// the percentage of height as padding between top of screen and content on play.dart
double getBoxAboveSpacing(double screenWidth, double screenHeight){
  double size = 0;
  if(screenWidth < 515 || screenHeight < 570){
    size = 0;
  }else if(screenWidth < 570 || screenHeight < 650){
    size = 0;
  }else if(screenWidth < 640 || screenHeight < 710){
    size = 0;
  }else if(screenWidth < 690 || screenHeight < 760){
    size = 0;
  }else if(screenWidth < 770 || screenHeight < 850){
    size = 0.03;
  }else{
    size = 0.05;
  }
  return size;
}

// width of border on boxes containing guesses on play.dart
double getBorderWidth(double screenWidth, double screenHeight){
  double width = 1;
  if(screenWidth < 515 || screenHeight < 570){
    width = 1;
  }else if(screenWidth < 570 || screenHeight < 650){
    width = 1;
  }else if(screenWidth < 640 || screenHeight < 710){
    width = 2;
  }else if(screenWidth < 690 || screenHeight < 760){
    width = 2;
  }else if(screenWidth < 770 || screenHeight < 850){
    width = 2;
  }else{
    width = 2;
  }
  return width;
}