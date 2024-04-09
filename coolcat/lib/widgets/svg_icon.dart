import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String svgPath;
  final double size;
  final bool showShadow;

  const SvgIcon({
    super.key,
    required this.svgPath,
    this.size = 24,
    this.showShadow = true
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        showShadow
          ? Positioned(
            left: 2,
            top: 2,
            child: SvgPicture.asset(
              svgPath,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.srcIn),
              width: size,
              height: size,
            ),
          )
          : Container(),
        SvgPicture.asset(
          svgPath,
          width: size,
          height: size,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ],
    );
  }

}