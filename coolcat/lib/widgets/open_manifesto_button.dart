import 'package:coolcat/constants/index.dart' show NumberConstants, ShadowConstants;
import 'package:coolcat/utils/index.dart' show ResponsiveUtils;
import 'package:coolcat/widgets/index.dart' show HoverButton, Manifesto;
import 'package:flutter/material.dart';

class OpenManifestoButton extends StatefulWidget {
  const OpenManifestoButton({super.key});

  @override
  OpenManifestoButtonState createState() => OpenManifestoButtonState();
}

class OpenManifestoButtonState extends State<OpenManifestoButton> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = BottomSheet.createAnimationController(this);
    animationController.duration = const Duration(milliseconds: 500);
    animationController.reverseDuration = const Duration(milliseconds: 500);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveUtils.isMobile(context);
    double fontSize = isMobile ? NumberConstants.textButtonFontSizeSmall : NumberConstants.textButtonFontSizeLarge;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: isMobile ? NumberConstants.paddingBottomSmall : NumberConstants.paddingBottomLarge),
        child: HoverButton(
          onPressed: () => _showManifesto(context),
          child: SizedBox(
            width: isMobile ? 168 : 240,
            height: isMobile ? 72 : 96,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 50.0,
                  height: isMobile ? 24 : 36,
                  child: Text(
                    '^',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isMobile ? 32 : 48,
                      color: Colors.white,
                      fontFamily: 'GloriaHallelujah',
                      shadows: ShadowConstants.shadowHeavy
                    ),
                  ),
                ),
                Text(
                  'MANIFESTO',
                  style: TextStyle(
                    fontSize: fontSize,
                    color: Colors.white,
                    fontFamily: 'GloriaHallelujah',
                    shadows: ShadowConstants.shadowHeavy
                  ),
                ),
              ],
            ),
          ),
        )
      )
    );
  }

  void _showManifesto(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      transitionAnimationController: animationController,
      constraints: const BoxConstraints(
        maxWidth: double.infinity
      ),
      builder: (BuildContext context) {
        return const Manifesto();
      },
    );
  }

}
