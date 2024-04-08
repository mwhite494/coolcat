import 'package:flutter/material.dart';

class TextConstants {

  static TextSpan manifesto(double fontSize) {
    return TextSpan(
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontFamily: "Roboto",
        fontWeight: FontWeight.w100
      ),
      children: const <TextSpan>[
        TextSpan(text: "This cat is cool, he is "),
        TextSpan(
          text: "coolcat",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(text: ".\n\nJust a cat, cool in every situation.\n\nhere is the manifestoo :\n\n\n"),
        TextSpan(
          text: "1. HISTOORY\n\n",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(
          // ignore: prefer_interpolation_to_compose_strings
          text: "This cat was foound oon internet after 5 minutes oof intensive research .\n\n" +
                "Then i doownlooaded the list oof wif hoolders too airdroop them 69% oof the supply, ai helped me" +
                "make the distributioon fairer, i doon't knoow what it means but apparently gini cooefficient is 0.7" +
                "noow vs 0.97 initially looks good and cool noow.\n\n" +
                "Then i cooded and wroote this smool manifestoo too shoow my visioon.\n\n\n"
        ),
        TextSpan(
          text: "2. VISION\n\n",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(
          // ignore: prefer_interpolation_to_compose_strings
          text: "Woorld is driven by attentioon its cute too see peoople launch memes but we gootta admit moost oof" +
                "them are cringy, why try too foorce a meme wif a new character oor a larp when yoou can just get" +
                "creative and doo soome cool shit.\n\n" +
                "Learn froom this experiment devs, i made my mooney wif wif and i doon't care aboout cool, i am" +
                "launching this foor fun and as an experiment.\n\n\n" +
                "Can a coomunity foorm froom noothing?\n\n" +
                "A good meme isn't foorced it just makes sense when it poops, it's that easy.\n\n" +
                "This is why this tooken is launched wifoout any soocials oor anything, just a cat, staying cool. if yoou" +
                "want it doo it.\n\n" +
                "Noo leaders, noo plans, noo marketing, noo insiders, i was aloone dooing this, can yoou believe it?\n\n" +
                "The humans grinding in the tranchees, i was there noot loong agoo, and yoou knoow what yoour" +
                "missioon is noow." +
                "Make the woorld goo crazy like we did wif wif.\n\n" +
                "Foor my part i'll enjooy my cool airdroop foor hoolding wif and i'll be there wif yoou, believe it oor noot.\n\n" +
                "Yoou'll never ear back froom me, yoou goot the keys, stay cool frens.\n\n" +
                "dn.\n\n\n"
        ),
        TextSpan(
          text: "CONTRACT : CooL79s3d23Zd2RfMXTRmUnfbAWBt4H6thn4sVkmYR9h\n\n\n",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
