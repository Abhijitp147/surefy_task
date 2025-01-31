// import 'package:contacts_service/contacts_service.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:surefy_task/presonal_call_info.dart';

class ContactsScreen extends StatefulWidget {
  final List<Contact> contacts;

  const ContactsScreen({
    super.key,
    required this.contacts,
  });

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: widget.contacts.length,
        itemBuilder: (context, index) {
          // Get contact
          Contact contact = widget.contacts[index];
          String phoneType = '';
          String firstName =
              widget.contacts[index].displayName!.characters.first;

          // Determine if the phone number starts with 9 or 8
          if (contact.phones != null && contact.phones!.isNotEmpty) {
            String phoneNumber = contact.phones!.first.value!;
            if (phoneNumber.isNotEmpty) {
              if (phoneNumber.startsWith('+91')) {
                phoneType = 'Personal';
              } else if (phoneNumber.startsWith('8')) {
                phoneType = 'Business';
              }
            }
          }

          return ListTile(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
            leading: CircleAvatar(
              radius: 24,
              // backgroundImage:
              //     (contact.avatar != null && contact.avatar!.isNotEmpty)
              //         ? MemoryImage(contact.avatar!)
              //         : null,
              child: (contact.avatar != null && contact.avatar!.isNotEmpty)
                  ? MemoryImage(contact.avatar!) as Image
                  : Text(firstName), // Default image if no avatar
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  contact.displayName ?? 'Unnamed',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 60,
                ),
                Text(
                  phoneType, // Display "Personal" or "Business"
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            subtitle: contact.phones!.isNotEmpty
                ? Text(contact.phones!.first.value!)
                : Text('No phone number'),
            onTap: () {
              // Navigate to the PersonalCallInfo screen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PresonalCallInfo(
                    contactName: contact.displayName ?? 'Unnamed',
                    phoneNumber: contact.phones!.isNotEmpty
                        ? contact.phones!.first.value!
                        : 'No phone number',
                    // phoneType: phoneType,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
