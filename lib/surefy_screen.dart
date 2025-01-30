import 'dart:async';

import 'package:flutter/material.dart';
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
    Timer(const Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const PremissionsScreen();
      }));
    });
    // Future.delayed(const Duration(seconds: 5), () {
    //   Navigator.of(context)
    //       .pushReplacement(MaterialPageRoute(builder: (context) {
    //     return const PremissionsScreen();
    //   }));
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      // alignment: Alignment.center,
      children: [
        Center(
          child: Container(
            // width: 200,
            // height: 200,
            decoration: BoxDecoration(
                // color: Colors.blue,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 200,
                      spreadRadius: 75,
                      color: Colors.blue.withOpacity(0.5))
                ]),
            child: const FlutterLogo(
              size: 100,
            ),
          ),
        ),
        const Positioned(
          bottom: 32,
          left: 0,
          right: 0,
          child: Icon(
            Icons.smartphone,
            size: 40,
            color: Colors.black,
          ),
        ),
      ],
    ));
  }
}


// SizedBox(
//       width: double.infinity,
//       child: Stack(
//         children: [
//           Center(
//             child: CircleAvatar(
//                 radius: 140,
//                 backgroundColor:
//                     Theme.of(context).primaryColor.withOpacity(.35),
//                 child: BackdropFilter(
//                     filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
//                     child: Image.asset('assets/surefy_logo.png'))),
//           ),
//           const Positioned(
//             bottom: 20,
//             left: 0,
//             right: 0,
//             child: Icon(
//               Icons.phone_android_rounded,
//               size: 48,
//             ),
//           ),
//         ],
//       ),
//     )