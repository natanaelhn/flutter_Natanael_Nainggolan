import 'package:flutter/material.dart';

class ContactProvider with ChangeNotifier{
  // ignore: prefer_final_fields
  List<Map<String,String>> _contactList = [
    { 
      'name' : 'Anton',
      'number': '012345678901',
    },
    { 
      'name' : 'Budi',
      'number': '012345678902',
    },
  ];

  List<Map<String,String>> get contactList => _contactList;

  void add(Map<String, String> contact){
    _contactList.add(contact);
    _contactList.sort(((a, b) => a['name']!.toUpperCase().compareTo(b['name']!.toUpperCase())));
    notifyListeners();
  }

  void remove(index){
    _contactList.removeAt(index);
    notifyListeners();
  }
}