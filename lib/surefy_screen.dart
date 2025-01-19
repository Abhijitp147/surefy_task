import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:surefy_task/premissions_screen.dart';

class SurefyScreen extends StatefulWidget {
  const SurefyScreen({super.key});

  @override
  State<SurefyScreen> createState() => _SurefyScreenState();
}

class _SurefyScreenState extends State<SurefyScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const PremissionsScreen();
      }));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Center(
            child: CircleAvatar(
                radius: 140,
                backgroundColor:
                    Theme.of(context).primaryColor.withOpacity(.35),
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                    child: Image.asset('assets/surefy_logo.png'))),
          ),
          const Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Icon(
              Icons.phone_android_rounded,
              size: 48,
            ),
          ),
        ],
      ),
    ));
  }
}
