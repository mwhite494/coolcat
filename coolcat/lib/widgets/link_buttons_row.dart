import 'dart:math';

import 'package:coolcat/constants/index.dart' show NumberConstants;
import 'package:coolcat/widgets/index.dart' show HoverButton;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButtonsRow extends StatelessWidget {
  const LinkButtonsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center, // Center the buttons horizontally
      children: [
        _TextLinkButton(text: "BUY", url: "https://jup.ag/swap/SOL-CooL79s3d23Zd2RfMXTRmUnfbAWBt4H6thn4sVkmYR9h"),
        _TextLinkButton(text: "CHART", url: "https://dexscreener.com/solana/3v6bfpfttdmvua5d9kalxrm1z7bt5hsbtkcqeg2ueiu4"),
        _IconLinkButton(imagePath: "assets/images/x_logo.png", url: "https://twitter.com/coolcat_sol"),
        _IconLinkButton(imagePath: "assets/images/telegram_logo.png.webp", url: "https://t.me/coolcatonsolana"),
      ],
    );
  }
}

class _TextLinkButton extends StatelessWidget {
  final String text;
  final String url;

  const _TextLinkButton({required this.text, required this.url});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool isMobile = min(screenWidth, screenHeight) < NumberConstants.mobileScreenWidthThreshold;
    double fontSize = isMobile ? NumberConstants.textButtonFontSizeSmall : NumberConstants.textButtonFontSizeLarge;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: HoverButton(
        onPressed: () => _launchURL(url),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
            fontFamily: 'GloriaHallelujah',
          ),
        ),
      )
    );
  }
}

class _IconLinkButton extends StatelessWidget {
  final String imagePath;
  final String url;

  const _IconLinkButton({required this.imagePath, required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: HoverButton(
        scale: 1.3,
        onPressed: () => _launchURL(url),
        child: Image.asset(
          imagePath,
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}

Future<void> _launchURL(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print('Could not launch $urlString');
  }
}

