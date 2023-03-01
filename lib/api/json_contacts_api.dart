class JsonContactApi {
  final String _contactsJson = '''
      {
      "contacts": [
        {
          "fullName": "John Doe (JSON)",
          "email": "johndoe@json.com",
          "favorite": true
        },
        {
          "fullName": "Emma Doe (JSON)",
          "email": "emmadoe@json.com",
          "favorite": false
        },
        {
          "fullName": "Michael Roe (JSON)",
          "email": "michaelroe@json.com",
          "favorite": false
        }
      ]
    }
    ''';

  String getContactsJson() {
    return _contactsJson;
  }
}
