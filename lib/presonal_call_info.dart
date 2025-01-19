import 'package:flutter/material.dart';
import 'package:surefy_task/floating_profile.dart';

class PresonalCallInfo extends StatelessWidget {
  const PresonalCallInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Container(
          color: Theme.of(context).primaryColor,
          height: MediaQuery.of(context).size.height * .25,
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Spacer(),
                    Text(
                      'Profile Details',
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.menu),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                CircleAvatar(
                  radius: 75,
                  child: Image.asset('assets/surefy_logo.png'),
                ),
                const SizedBox(
                  height: 25,
                ),
                Image.asset(
                  'assets/surefy_logo.png',
                  scale: 5,
                ),
                const Text('Ak'),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardOptions(
                      icon: Icons.call,
                      title: 'Call',
                    ),
                    CardOptions(
                      title: 'Message',
                      icon: Icons.message,
                    ),
                    CardOptions(
                      title: 'Notes',
                      icon: Icons.notes_rounded,
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Contact',
                  ),
                ),
                const Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ListTile(
                        title: Text('Ass'),
                        subtitle: Text('vdvfb'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.phone),
                            ),
                            Icon(Icons.message)
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('+91 9646464645'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Mobile'),
                              ],
                            ),
                          ),
                          Icon(Icons.phone),
                          Icon(Icons.message),
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('+91 9646464645'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text('Mobile'),
                              ],
                            ),
                          ),
                          Icon(Icons.phone),
                          Icon(Icons.message),
                        ],
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'other',
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Add to'),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Add to'),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Call History',
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15))),
                  child: ListTile(
                    leading: Icon(Icons.favorite),
                    title: Text('Add to'),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    ));
  }
}

class CardOptions extends StatelessWidget {
  final String title;
  final IconData icon;
  const CardOptions({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 16),
        child: Column(
          children: [Icon(icon), Text(title)],
        ),
      ),
    );
  }
}
