import 'package:flutter/material.dart';

class OpenManifestoButton extends StatelessWidget {
  const OpenManifestoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 36,
              alignment: Alignment.topCenter,
              child: const Text(
                '^',
                style: TextStyle(
                  fontSize: 48,
                  color: Colors.white,
                  fontFamily: 'GloriaHallelujah',
                ),
              ),
            ),
            const Text(
              'MANIFESTO',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'GloriaHallelujah',
              ),
            ),
          ],
        ),
      )
    );
  }
}
