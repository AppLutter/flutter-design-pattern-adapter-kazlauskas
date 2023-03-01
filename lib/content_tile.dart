import 'package:flutter/material.dart';
import 'package:flutter_adapter_test/models/contact.dart';

class ContentTile extends StatelessWidget {
  const ContentTile({
    Key? key,
    required this.contact,
    required this.index,
  }) : super(key: key);
  final Contact contact;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.primaries[index].withOpacity(0.8),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Text(
              contact.fullName,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const Spacer(),
            Text(contact.email),
          ],
        ),
      ),
    );
  }
}
