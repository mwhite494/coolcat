import 'package:coolcat/constants/index.dart' show TextConstants;
import 'package:flutter/material.dart';

class Manifesto extends StatelessWidget {
  const Manifesto({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(24),
      color: Colors.black.withOpacity(0.8),
      child: SafeArea(
        child: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(48, 48, 48, 0),
              child: SingleChildScrollView(
                child: Text(
                  TextConstants.manifesto,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                hoverColor: Colors.transparent,
                onPressed: () => Navigator.of(context).pop(), // Close the modal
              ),
            )
          ],
        ),
      ),
    );
  }
}
