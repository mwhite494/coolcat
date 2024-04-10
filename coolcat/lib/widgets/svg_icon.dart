import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String svgPath;
  final double size;
  final String svgShadowPath;

  const SvgIcon({
    super.key,
    required this.svgPath,
    this.size = 24,
    this.svgShadowPath = ''
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        svgShadowPath.isNotEmpty
          ? Positioned(
            left: 2,
            top: 2,
            child: SvgPicture.asset(
              svgShadowPath,
              width: size,
              height: size
            ),
          )
          : Container(),
        SvgPicture.asset(
          svgPath,
          width: size,
          height: size
        ),
      ],
    );
  }

}