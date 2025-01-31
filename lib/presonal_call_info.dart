import 'package:flutter/material.dart';

class PresonalCallInfo extends StatelessWidget {
  const PresonalCallInfo({
    super.key,
    required this.contactName,
    required this.phoneNumber,
  });
  final double coverHeight = 210;
  final profileHeight = 150;

  final String contactName;
  final String? phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          buildStack(),
          SizedBox(
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/image4.png'),
                Text(contactName),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              cards('Call', Icons.phone),
              cards('Message', Icons.message),
              cards('Notes', Icons.note_add)
            ],
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Contact Info',
                  ),
                ),
                SizedBox(height: 8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Column(
                      children: [
                        contactTile(phoneNumber!, 'Work'),
                        const Divider(),
                        contactTile(phoneNumber!, 'Work'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Other',
                  ),
                ),
                SizedBox(height: 8),
                const Card(
                  child: ListTile(
                    leading: Icon(Icons.favorite_border),
                    title: Text('Add to Favorites'),
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Delete Contact',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Call History',
                  ),
                ),
                SizedBox(height: 8),
                const Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: ListTile(
                    title: Text('OutGoing'),
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.arrow_outward_outlined,
                          color: Colors.green,
                          size: 12,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Today'),
                        SizedBox(
                          width: 5,
                        ),
                        Text('1200')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget contactTile(String number, String info) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              number,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              info,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.call),
              onPressed: () {
                // Add call action
              },
            ),
            IconButton(
              icon: const Icon(Icons.message),
              onPressed: () {
                // Add message action
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget cards(String option, IconData icon) {
    return SizedBox(
      width: 107,
      height: 66,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
                color: Colors.grey,
              ),
              Text(
                option,
                style: const TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStack() {
    final top = coverHeight - profileHeight / 2;
    final bottom = profileHeight / 1.5;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
              margin: EdgeInsets.only(bottom: bottom),
              child: buildCoverImage()),
          const Positioned(
              top: 30,
              child: Text(
                'Profile Details',
                style: TextStyle(color: Colors.white),
              )),
          const Positioned(
              top: 30,
              right: 10,
              child: Icon(
                Icons.menu,
                color: Colors.white,
              )),
          Positioned(top: top, child: buildProfileImage()),
        ]);
  }

  Widget buildProfileImage() => CircleAvatar(
        radius: profileHeight / 2,
        backgroundColor: Colors.grey,
        child: Image.asset(
          'assets/image1.png',
        ),
      );

  Widget buildCoverImage() {
    return Image.asset(
      'assets/image2.png',
      height: coverHeight,
      fit: BoxFit.cover,
    );
  }
}
