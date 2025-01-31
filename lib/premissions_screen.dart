import 'package:call_log/call_log.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:surefy_task/home_page.dart';
// import 'package:surefy_task/widgets/contacts_screen.dart';

class PremissionsScreen extends StatefulWidget {
  const PremissionsScreen({super.key});

  @override
  State<PremissionsScreen> createState() => _PremissionsScreenState();
}

class _PremissionsScreenState extends State<PremissionsScreen> {
  Future<void> _requestPermissions(BuildContext context) async {
    // Requesting permissions
    var statusContacts = await Permission.contacts.request();
    var statusCallLogs = await Permission.phone.request();

    // Check if permissions are granted
    if (statusContacts.isGranted && statusCallLogs.isGranted) {
      // Permissions granted, access contacts and navigate to next screen
      _fetchContacts(context);
    } else {
      // If permissions are not granted, show a message to the user
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                "Permissions are required to access contacts and call logs")),
      );
    }
  }

  // Function to fetch contacts
  void _fetchContacts(BuildContext context) async {
    try {
      List<Contact> contacts = await ContactsService.getContacts();
      Iterable<CallLogEntry> callLogs = await CallLog.get();
      // Navigate to the ContactsScreen with the contacts data
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            contacts: contacts,
            callLog: callLogs.toList(),
          ),
        ),
      );
    } catch (e) {
      print("Error fetching contacts: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to fetch contacts!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.asset(
            'assets/image3.png',
            // height: 396,
            // width: 390,
          ),
          const Spacer(),
          const SizedBox(
            height: 88,
            child: Column(
              children: [
                Text(
                  'Access Your Call Logs',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'We need access to your contacts and call logs to help you connect and manage your communication seamlessly',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () => _requestPermissions(context),
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(197, 44),
                // maximumSize: Size(197, 44),
                elevation: 5,
                backgroundColor: const Color(0xff5864F8),
                foregroundColor: Colors.white),
            child: const Text(
              'Allow Access',
            ),
          ),
          const Spacer(
            flex: 2,
          )
        ],
      ),
    );
  }
}
