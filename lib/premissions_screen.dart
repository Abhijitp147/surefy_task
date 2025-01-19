import 'package:flutter/material.dart';
import 'package:surefy_task/calls_screen.dart';

class PremissionsScreen extends StatelessWidget {
  const PremissionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Image.asset(
            'assets/pngwing.png',
            height: 380,
          ),
          const Spacer(flex: 2),
          const Text(
            'Access Your Call Logs',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'We need access to your contacts and call logs to help you connect and manage your communication seamlessly',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const CallsScreen()));
            },
            style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: const Color(0xff5864F8),
                foregroundColor: Colors.white),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
              child: Text('Allow Access'),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
