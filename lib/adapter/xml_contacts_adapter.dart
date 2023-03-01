import 'dart:convert';

import 'package:flutter_adapter_test/adapter/i_contacts_adapter.dart';
import 'package:flutter_adapter_test/api/xml_contacts_api.dart';
import 'package:flutter_adapter_test/models/contact.dart';
import 'package:xml/xml.dart';

class XmlContactsAdapter implements IContactsAdapter {
  final XmlContactsApi _api = XmlContactsApi();

  @override
  List<Contact> getContacts() {
    final contactsXml = _api.getContactsXml();
    final contactsList = _parseContactsXml(contactsXml);

    return contactsList;
  }

  List<Contact> _parseContactsXml(String contactsXml) {
    final xmlDocument = XmlDocument.parse(contactsXml);
    final List<Contact> contactsList = [];

    for (var xmlElement in xmlDocument.findAllElements('contact')) {
      final fullName = xmlElement.findElements('fullname').single.text;
      final email = xmlElement.findElements('email').single.text;
      final favoriteString = xmlElement.findElements('favorite').single.text;
      final favorite = favoriteString.toLowerCase() == 'true';

      contactsList.add(
        Contact(
          fullName: fullName,
          email: email,
          favorite: favorite,
        ),
      );
    }
    return contactsList;
  }
}
