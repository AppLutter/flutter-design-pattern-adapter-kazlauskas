import 'dart:convert';

import 'package:flutter_adapter_test/adapter/i_contacts_adapter.dart';
import 'package:flutter_adapter_test/api/json_contacts_api.dart';
import 'package:flutter_adapter_test/models/contact.dart';

class JsonContactsAdapter implements IContactsAdapter {
  final JsonContactApi _api = JsonContactApi();

  @override
  List<Contact> getContacts() {
    final contactsJson = _api.getContactsJson();
    final contactsList = _parseContactsJson(contactsJson);

    return contactsList;
  }

  List<Contact> _parseContactsJson(String contactsJson) {
    final contactsMap = json.decode(contactsJson) as Map<String, dynamic>;
    final contactsJsonList = contactsMap['contacts'] as List;
    final contactsList = contactsJsonList
        .map(
          (json) => Contact(
            fullName: json['fullName'],
            email: json['email'],
            favorite: json['favorite'],
          ),
        )
        .toList();

    return contactsList;
  }
}
