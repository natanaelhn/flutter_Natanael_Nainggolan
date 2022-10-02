import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/model/contacts.dart';
import 'package:flutter_application_form_input_button/model/posts.dart';
import 'package:flutter_application_form_input_button/model/theme.dart';

class Data{

  static String contactsPageTitle = 'Contacts';
  static String addContactPageTitle = 'Create New Contacts';
  static String postPageTitle = 'Post';

  static Contacts personalInfo = Contacts('MC', number: '08116550805', profilePic: 'maleMC.jpg', theme: MyTheme.black);

  static List<Contacts> contactsData = [
    Contacts('Airi Akitsuki', number: '012782233218', profilePic: 'Airi.jpg', theme: MyTheme.amber),
    Contacts('Miyuri Asou', number: '012849317817', profilePic: 'Miyuri.jpg', theme: MyTheme.green),
    Contacts('Sunao Unyu', number: '029374623794', profilePic: 'Sunao.jpg', theme: MyTheme.teal),
    Contacts('Otona Mitsuki', number: '073796013213', profilePic: 'Otona.png', theme: MyTheme.black ,favorite: true),
    Contacts('Hachishaku-san', number: '027469133232', profilePic: 'Hachishaku-san.PNG', theme: MyTheme.grey, favorite: true),
    Contacts('Mina-san', number: '031974632731', profilePic: 'Mina-san.PNG', theme: MyTheme.teal),
    Contacts('Mari Setagaya', number: '079618233213', profilePic: 'Mari.jpg', theme: MyTheme.crimson),
    Contacts('Ayane Shirakawa', number: '079126372131', profilePic: 'Ayane.PNG', theme: MyTheme.amber, favorite: true),
    Contacts('Orifushi Mafuyu', number: '097613786123', profilePic: 'Mafuyu.PNG', theme: MyTheme.grey),
    Contacts('Tsubakihara Mira', number: '051237126192', profilePic: 'Mira.jpg', theme: MyTheme.amber, favorite: true),
    Contacts('Aria-san', number: '016374981391', profilePic: 'Aria.PNG', theme: MyTheme.amber, favorite: true),
    Contacts('Yuzuki Aoi', number: '029740623334', profilePic: 'Aoi.PNG', theme: MyTheme.crimson ,favorite: true),
    Contacts('Aika-san', number: '023467239763', profilePic: 'Aika.PNG', theme: MyTheme.amber, favorite: true),

  ];

  // static List<MyTheme> themeList = [
  //   MyTheme('amber', 'amber.jpg', const Color.fromARGB(255, 156, 68, 0)),
  //   MyTheme('black', 'black.jpg', Colors.black),
  //   MyTheme('crimson', 'crimson.jpg', const Color.fromARGB(255, 138, 0, 0)),
  //   MyTheme('green', 'green.jpg', const Color.fromARGB(255, 0, 88, 6)),
  //   MyTheme('grey', 'grey.jpg', const Color.fromARGB(255, 48, 48, 48)),
  //   MyTheme('teal', 'cyan.jpg', Colors.cyan.shade900),
    

  // ];

  Data(){

    List<Posts> listPosts = [
        Posts(caption: 'My friend just take a picture of me at the beach.\nI shouldn\'t have let my guard down', fileName: 'Aika1.PNG', dateTime: DateTime(2022, 3, 18),),
        Posts(caption: 'Yey...\nGetting vacation with family', fileName: 'AiriAkitsuki1.PNG', dateTime: DateTime(2022, 5, 13), ),
        Posts(caption: '', fileName: 'AiriAkitsuki2.jpg', dateTime: DateTime(2022, 6, 9), ),
        Posts(caption: '', fileName: 'AiriAkitsuki3.jpg', dateTime: DateTime(2022, 8, 4), ),
        Posts(caption: '', fileName: 'AyaneShirakawa1.jpg', dateTime: DateTime(2022, 2, 18), bgColor: const Color.fromARGB(255, 248, 226, 177)),
        Posts(caption: 'Cheering school team is hella fun\nIm so sweaty', fileName: 'AyaneShirakawa2.jpg', dateTime: DateTime(2022, 1, 6), ),
        Posts(caption: '', fileName: 'AyaneShirakawa3.jpg', dateTime: DateTime(2022, 8, 31), ),
        Posts(caption: 'My nephew XD', fileName: 'Hachishaku1.PNG', dateTime: DateTime(2022, 4, 4), bgColor: const Color.fromARGB(255, 190, 190, 190)),
        Posts(caption: 'I just know that oversized jacket feels comfy', fileName: 'MariSetagaya1.png', dateTime: DateTime(2022, 3, 7), ),
        Posts(caption: 'Finally going to Karaoke with colleague <3', fileName: 'Mina1.jpg', dateTime: DateTime(2022, 2, 7), bgColor: const Color.fromARGB(255, 58, 58, 58) , fgColor: Colors.white),
        Posts(caption: '', fileName: 'MiyuriAsou1.PNG', dateTime: DateTime(2022, 1, 8), ),
        Posts(caption: '', fileName: 'OrifushiMafuyu1.PNG', dateTime: DateTime(2022, 7, 7), ),
        Posts(caption: 'Oh boi it\'s 3AM', fileName: 'SunaoUnyu1.PNG', dateTime: DateTime(2022, 1, 21), ),
        Posts(caption: 'I hope i can be young again XD', fileName: 'TsubakiharaMira1.PNG', dateTime: DateTime(2022, 2, 1), bgColor: const Color.fromARGB(255, 155, 132, 0), fgColor: Colors.white),
        Posts(caption: 'My heart\'s pounding', fileName: 'YuzukiAoi1.jpg', dateTime: DateTime(2022, 4, 15), ),
        Posts(caption: '', fileName: 'YuzukiAoi2.jpg', dateTime: DateTime(2022, 2, 27), bgColor: const Color.fromARGB(255, 255, 198, 123)),
    ];

    List<String> listOfOwnerNamePairedToPost = [
      'Aika-san',
      'Airi Akitsuki', 'Airi Akitsuki', 'Airi Akitsuki',
      'Ayane Shirakawa', 'Ayane Shirakawa', 'Ayane Shirakawa',
      'Hachishaku-san',
      'Mari Setagaya',
      'Mina-san',
      'Miyuri Asou',
      'Orifushi Mafuyu',
      'Sunao Unyu',
      'Tsubakihara Mira',
      'Yuzuki Aoi', 'Yuzuki Aoi'
    ];

    for(int i = 0; i < listPosts.length; i++){
      for(Contacts j in contactsData){
        if(j.name == listOfOwnerNamePairedToPost[i]){
          addInitialPostToContacts(post: listPosts[i], ownerName: listOfOwnerNamePairedToPost[i]);
          break;
        }
      }
    }
  }

  addInitialPostToContacts({required Posts post, required String ownerName}){
    for(Contacts i in contactsData){
      if (i.name == ownerName){
        post.ownerId = i.id;
        i.listPost.add(post);
        break;
      }
    }
  }
}