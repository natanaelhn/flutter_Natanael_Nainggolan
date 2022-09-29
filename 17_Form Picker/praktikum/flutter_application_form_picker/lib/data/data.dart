import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/data/contacts.dart';
import 'package:flutter_application_form_input_button/data/posts.dart';

class Data{

  Data(){
    addPostToContacts(
      posts: [
        Posts(caption: 'My friend just take a picture of me at the beach.\nI should have\'nt let my guard down', fileName: 'Aika1.PNG', dateTime: DateTime(2022, 3, 18), ownerName: 'Aika-san'),
        Posts(caption: 'Yey...\nGetting vacation with family', fileName: 'AiriAkitsuki1.PNG', dateTime: DateTime(2022, 5, 13), ownerName: 'Airi Akitsuki'),
        Posts(caption: '', fileName: 'AiriAkitsuki2.jpg', dateTime: DateTime(2022, 6, 9), ownerName: 'Airi Akitsuki'),
        Posts(caption: '', fileName: 'AiriAkitsuki3.jpg', dateTime: DateTime(2022, 8, 4), ownerName: 'Airi Akitsuki'),
        Posts(caption: '', fileName: 'AyaneShirakawa1.jpg', dateTime: DateTime(2022, 2, 18), ownerName: 'Ayane Shirakawa', bgColor: const Color.fromARGB(255, 255, 253, 133)),
        Posts(caption: 'Cheering school team is hella fun\nIm so sweaty', fileName: 'AyaneShirakawa2.jpg', dateTime: DateTime(2022, 1, 6), ownerName: 'Ayane Shirakawa'),
        Posts(caption: '', fileName: 'AyaneShirakawa3.jpg', dateTime: DateTime(2022, 8, 31), ownerName: 'Ayane Shirakawa'),
        Posts(caption: 'My nephew XD', fileName: 'Hachishaku1.PNG', dateTime: DateTime(2022, 4, 4), ownerName: 'Hachishaku-san', bgColor: const Color.fromARGB(255, 190, 190, 190)),
        Posts(caption: 'I just know that oversized jacket feels comfy', fileName: 'MariSetagaya1.png', dateTime: DateTime(2022, 3, 7), ownerName: 'Mari Setagaya'),
        Posts(caption: 'Finally going to Karaoke with colleague <3', fileName: 'Mina1.jpg', dateTime: DateTime(2022, 2, 7), ownerName: 'Mina-san'),
        Posts(caption: '', fileName: 'MiyuriAsou1.PNG', dateTime: DateTime(2022, 1, 8), ownerName: 'Miyuri Asou'),
        Posts(caption: '', fileName: 'OrifushiMafuyu1.PNG', dateTime: DateTime(2022, 7, 7), ownerName: 'Orifushi Mafuyu'),
        Posts(caption: 'Oh boi it\'s 3AM', fileName: 'SunaoUnyu1.PNG', dateTime: DateTime(2022, 1, 21), ownerName: 'Sunao Unyu'),
        Posts(caption: '', fileName: 'TsubakiharaMira1.PNG', dateTime: DateTime(2022, 2, 1), ownerName: 'Tsubakihara Mira'),
        Posts(caption: 'My heart\'s pounding', fileName: 'YuzukiAoi1.jpg', dateTime: DateTime(2022, 4, 15), ownerName: 'Yuzuki Aoi'),
        Posts(caption: '', fileName: 'YuzukiAoi2.jpg', dateTime: DateTime(2022, 2, 27), ownerName: 'Yuzuki Aoi', bgColor: const Color.fromARGB(255, 255, 198, 123)),

      ], 
    );
  }

  static String contactsPageTitle = 'Contacts';
  static String addContactPageTitle = 'Create New Contacts';
  static String postPageTitle = 'Post';

  static Contacts personalInfo = Contacts('MC', number: '08116550805', profilePic: 'maleMC.jpg',);

  static List<Contacts> contactsData = [
    Contacts('Airi Akitsuki', number: '012782233218', profilePic: 'Airi.jpg'),
    Contacts('Miyuri Asou', number: '012849317817', profilePic: 'Miyuri.jpg'),
    Contacts('Sunao Unyu', number: '029374623794', profilePic: 'Sunao.jpg'),
    Contacts('Otona Mitsuki', number: '073796013213', profilePic: 'Otona.png', favorite: true),
    Contacts('Hachishaku-san', number: '027469133232', profilePic: 'Hachishaku-san.PNG', favorite: true),
    Contacts('Mina-san', number: '031974632731', profilePic: 'Mina-san.PNG'),
    Contacts('Mari Setagaya', number: '079618233213', profilePic: 'Mari.jpg'),
    Contacts('Ayane Shirakawa', number: '079126372131', profilePic: 'Ayane.PNG', favorite: true),
    Contacts('Orifushi Mafuyu', number: '097613786123', profilePic: 'Mafuyu.PNG'),
    Contacts('Tsubakihara Mira', number: '051237126192', profilePic: 'Mira.jpg', favorite: true),
    Contacts('Aria-san', number: '016374981391', profilePic: 'Aria.PNG', favorite: true),
    Contacts('Yuzuki Aoi', number: '029740623334', profilePic: 'Aoi.PNG', favorite: true),
    Contacts('Aika-san', number: '023467239763', profilePic: 'Aika.PNG', favorite: true),

  ];

  addPostToContacts({required List<Posts> posts}){
    for(Posts i in posts){
      for(Contacts j in contactsData){
        if(j.name == i.ownerName){
          j.listPost.add(i);
          break;
        }
      }
    }
  }


  
}