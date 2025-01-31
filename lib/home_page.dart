import 'package:call_log/call_log.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_contacts/contact.dart';
import 'package:surefy_task/widgets/calls_screen.dart';
import 'package:surefy_task/widgets/components.dart';
import 'package:surefy_task/widgets/contacts_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.contacts,
    required this.callLog,
  });
  final List<Contact> contacts;
  final List<CallLogEntry> callLog;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> filters = const [
    'Calls',
    'Contacts',
    'Messages',
    'Favorites'
  ];

  late String selectedoption;

  late Widget screenWidget;
  @override
  void initState() {
    super.initState();
    selectedoption = filters[0];
    screenWidget = CallsScreen(
      callLog: widget.callLog,
    );
  }

  void changeScreen() {
    screenWidget = CallsScreen(
      callLog: widget.callLog,
    );
    if (selectedoption == filters[1]) {
      screenWidget = ContactsScreen(
        contacts: widget.contacts,
      );
    } else if (selectedoption == filters[2]) {
      screenWidget = const ContactsScreen(
        contacts: [],
      );
    } else if (selectedoption == filters[3]) {
      screenWidget = const ContactsScreen(
        contacts: [],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/image.png'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: 36,
              child: ListView.builder(
                  itemCount: filters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    return Components(
                      option: filter,
                      isActive: selectedoption,
                      onTap: () {
                        setState(() {
                          selectedoption = filter;
                          changeScreen;
                        });
                      },
                    );
                  }),
            ),
            Expanded(child: screenWidget)
          ],
        ),
      ),
      bottomNavigationBar: selectedoption == 'Contacts'
          ? null
          : BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.connect_without_contact),
                  label: 'Connects',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.dialpad),
                  label: 'Dialpad',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
    );
  }
}
