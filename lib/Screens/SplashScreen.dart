import 'package:advans_app/Utils/ColorsAndThemes/myColors.dart';
import 'package:advans_app/Widgets/TypingTextAnimation.dart';
import 'package:advans_app/Widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/images/image.png"))
                .animate()
                .fade(
                    delay: Duration(milliseconds: 100),
                    duration: Duration(milliseconds: 400))
                .scale(
                    delay: Duration(milliseconds: 100),
                    duration: Duration(milliseconds: 400))
                .slide(),

            // baseline=800ms

            TypingTextAnimation()
          ],
        ),
      ),
    );
  }
}
