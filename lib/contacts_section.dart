import 'package:flutter/material.dart';
import 'package:flutter_adapter_test/adapter/i_contacts_adapter.dart';
import 'package:flutter_adapter_test/content_tile.dart';
import 'package:flutter_adapter_test/models/contact.dart';

class ContactsSection extends StatefulWidget {
  const ContactsSection({
    Key? key,
    required this.adapter,
    required this.headerText,
  }) : super(key: key);
  final IContactsAdapter adapter;
  final String headerText;

  @override
  State<ContactsSection> createState() => _ContactsSectionState();
}

class _ContactsSectionState extends State<ContactsSection> {
  late List<Contact> contacts;

  @override
  void initState() {
    super.initState();
    contacts = widget.adapter.getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.headerText,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          ...List.generate(
            contacts.length,
            (index) => ContentTile(
              contact: contacts[index],
              index: index,
            ),
          ),
        ],
      ),
    );
  }
}
