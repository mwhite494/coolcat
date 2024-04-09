import 'dart:ui';

import 'package:coolcat/constants/index.dart' show TextConstants;
import 'package:flutter/material.dart';

class Manifesto extends StatelessWidget {
  const Manifesto({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
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
                    padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    child: Column (
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 48.0),
                          child: CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage('assets/images/coolcat.jpeg'),
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
                  iconSize: 32.0,
                  padding: const EdgeInsets.all(12),
                  hoverColor: Colors.transparent,
                  onPressed: () => Navigator.of(context).pop(), // Close the modal
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
