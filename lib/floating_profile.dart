import 'package:flutter/material.dart';

class FloatingProfile extends StatelessWidget {
  final double screenHeight;

  const FloatingProfile({super.key, required this.screenHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.25,
      color: Theme.of(context).primaryColor,
    );
  }
}
