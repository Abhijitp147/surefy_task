import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_contacts/contact.dart';

class CallsScreen extends StatefulWidget {
  const CallsScreen({
    super.key,
    required this.callLog,
  });
  final List<CallLogEntry> callLog;

  @override
  State<CallsScreen> createState() => _CallsScreenState();
}

class _CallsScreenState extends State<CallsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: widget.callLog.length,
        itemBuilder: (context, index) {
          // Get contact
          CallLogEntry call = widget.callLog[index];
          String firstName = widget.callLog[index].name!.characters.first;

          return ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              leading: CircleAvatar(
                radius: 24,
                child: Text(firstName),
              ),
              title: Text(call.name ?? 'Unknown'));
        },
      ),
    );
  }
}
