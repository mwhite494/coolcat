import 'package:coolcat/constants/index.dart' show NumberConstants, ShadowConstants;
import 'package:coolcat/utils/index.dart' show ResponsiveUtils;
import 'package:coolcat/widgets/index.dart' show HoverButton, SvgIcon;
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
        _IconLinkButton(svgPath: "assets/svg/x_logo.svg", url: "https://twitter.com/coolcat_sol"),
        _IconLinkButton(svgPath: "assets/svg/telegram_logo.svg", url: "https://t.me/coolcatonsolana"),
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
    bool isMobile = ResponsiveUtils.isMobile(context);
    double fontSize = isMobile ? NumberConstants.textButtonFontSizeSmall : NumberConstants.textButtonFontSizeLarge;
    
    return HoverButton(
      onPressed: () => _launchURL(url),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.white,
            fontFamily: 'GloriaHallelujah',
            shadows: ShadowConstants.shadowHeavy,
          ),
        ),
      )
    );
  }
}

class _IconLinkButton extends StatelessWidget {
  final String svgPath;
  final String url;

  const _IconLinkButton({required this.svgPath, required this.url});

  @override
  Widget build(BuildContext context) {
    return HoverButton(
      scale: 1.3,
      onPressed: () => _launchURL(url),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: SvgIcon(svgPath: svgPath),
      )
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

