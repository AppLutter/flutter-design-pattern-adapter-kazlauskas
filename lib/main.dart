import 'package:flutter/material.dart';
import 'package:flutter_adapter_test/adapter/json_contacts_adapter.dart';
import 'package:flutter_adapter_test/adapter/xml_contacts_adapter.dart';
import 'package:flutter_adapter_test/contacts_section.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('제목'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        children: <Widget>[
          ContactsSection(adapter: JsonContactsAdapter(), headerText: 'JSON 부분입니다.'),
          ContactsSection(adapter: XmlContactsAdapter(), headerText: 'XML 부분입니다.'),
        ],
      ),
    );
  }
}
