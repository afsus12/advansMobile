import 'dart:async';

import 'package:advans_app/Screens/LoginScreen.dart';
import 'package:advans_app/Screens/LandingScreen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class TypingTextAnimation extends StatefulWidget {
  const TypingTextAnimation({super.key});

  @override
  State<TypingTextAnimation> createState() => _TypingTextAnimationState();
}

class _TypingTextAnimationState extends State<TypingTextAnimation> {
  bool _showText = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 800), () {
      setState(() {
        _showText = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _showText
        ? DefaultTextStyle(
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            child: AnimatedTextKit(
              onNext: (index, isLast) {
                if (isLast) {
                  Future.delayed(Duration(milliseconds: 100), () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LandingScreen()));
                  });
                }
              },
              animatedTexts: [
                TypewriterAnimatedText(
                  cursor: '|',
                  'Growing together',
                  speed: const Duration(milliseconds: 50),
                ),
                TypewriterAnimatedText('Tunisa MicroFinance Bank',
                    speed: const Duration(milliseconds: 50)),
              ],
              totalRepeatCount: 1,
              pause: const Duration(milliseconds: 100),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            ),
          )
        : SizedBox.shrink();
  }
}
