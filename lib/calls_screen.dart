import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});
  final List<String> filters = const [
    'Calls',
    'Contacts',
    'Messages',
    'Favorites'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/surefy_logo.png'),
        title: const Column(
          children: [
            Text('SUREFY.AI', style: TextStyle(color: Color(0xff5864F8))),
            Text(
              'always be sure',
              style: TextStyle(fontSize: 8, color: Color(0xff5864F8)),
            ),
          ],
        ),
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 75,
            child: ListView.builder(
                itemCount: filters.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Chip(
                      label: Row(
                        children: [
                          Text(filters[index]),
                          Icon(Icons.keyboard_arrow_down)
                        ],
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  );
                }),
          ),
          // _buildTabBar(),
          // Expanded(child: _buildCallList()
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.connect_without_contact),
            label: 'Connects',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.dialpad),
            label: 'Dialpad',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Widget _buildTabBar() {
  //   return Container(
  //     color: Colors.white,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         _buildTabItem('Calls', true),
  //         _buildTabItem('Contacts', false),
  //         _buildTabItem('Messages', false),
  //         _buildTabItem('Favorites', false),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildTabItem(String title, bool isSelected) {
  //   return Column(
  //     children: [
  //       Text(
  //         title,
  //         style: TextStyle(
  //           color: isSelected ? Colors.blue : Colors.grey,
  //           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
  //         ),
  //       ),
  //       if (isSelected)
  //         Container(
  //           margin: const EdgeInsets.only(top: 4),
  //           height: 2,
  //           width: 40,
  //           color: Colors.blue,
  //         )
  //     ],
  //   );
  // }

  // Widget _buildCallList() {
  //   return ListView.builder(
  //     itemCount: 10,
  //     itemBuilder: (context, index) {
  //       return _buildCallTile();
  //     },
  //   );
  // }

  // Widget _buildCallTile() {
  //   return ListTile(
  //     leading: const CircleAvatar(
  //       child: Icon(Icons.person),
  //     ),
  //     title: const Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text('+91 9685485260', style: TextStyle(fontWeight: FontWeight.bold)),
  //         Text('12:00 PM', style: TextStyle(color: Colors.grey)),
  //       ],
  //     ),
  //     subtitle: Row(
  //       children: [
  //         const Icon(Icons.call_made, color: Colors.green, size: 16),
  //         const SizedBox(width: 5),
  //         const Text('Outgoing', style: TextStyle(color: Colors.grey)),
  //         const SizedBox(width: 10),
  //         Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
  //           decoration: BoxDecoration(
  //             color: Colors.green[50],
  //             borderRadius: BorderRadius.circular(12),
  //           ),
  //           child: const Text(
  //             'Business',
  //             style: TextStyle(color: Colors.green, fontSize: 12),
  //           ),
  //         ),
  //       ],
  //     ),
  //     trailing: const Icon(Icons.info_outline, color: Colors.grey),
  //   );
}
// }
