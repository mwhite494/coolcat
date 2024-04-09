import 'dart:ui';

import 'package:coolcat/constants/index.dart' show TextConstants;
import 'package:coolcat/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class Manifesto extends StatelessWidget {

  const Manifesto({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveUtils.isMobile(context);

    return ClipRect(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(24),
            color: Colors.black.withOpacity(0.7),
            child: SafeArea(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 48.0),
                        child: Column (
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 48.0),
                              child: CircleAvatar(
                                radius: isMobile ? 60 : 100,
                                backgroundImage: const AssetImage('assets/images/coolcat.jpeg'),
                              ),
                            ),
                            RichText(
                              text: TextConstants.manifesto(24),
                            ),
                          ],
                        )
                      )
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      iconSize: isMobile ? 24.0 : 32.0,
                      padding: const EdgeInsets.all(12),
                      hoverColor: Colors.transparent,
                      onPressed: () => Navigator.of(context).pop(), // Close the modal
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
