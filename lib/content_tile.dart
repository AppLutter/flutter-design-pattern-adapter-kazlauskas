import 'package:flutter/material.dart';
import 'package:flutter_adapter_test/models/contact.dart';

class ContentTile extends StatelessWidget {
  const ContentTile({
    Key? key,
    required this.contact,
  }) : super(key: key);
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(contact.fullName),
            Text(contact.email),
          ],
        ),
      ],
    );
  }
}
