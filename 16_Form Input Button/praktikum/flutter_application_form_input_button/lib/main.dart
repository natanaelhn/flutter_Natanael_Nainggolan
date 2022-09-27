import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/add_contact_page.dart';
import 'package:flutter_application_form_input_button/contact_detail_page.dart';
import 'package:flutter_application_form_input_button/contacts.dart';
import 'package:flutter_application_form_input_button/data.dart';
import 'package:flutter_application_form_input_button/favorite_contact_widget.dart';
import 'package:flutter_application_form_input_button/profile_picture_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //for drag scrolling in windowsApp
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse, 
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        }
      ),
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Contacts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? initialContact;
  String? initialFavContact;
  bool favoriteShowed = false;
  TextEditingController searchController = TextEditingController();
  bool searchIsEmpty = true;

  @override
  void initState() {
    Data.contactsData.sort(((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase())) );
    favoriteShowed = false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              searchIsEmpty ? Text(widget.title, style: const TextStyle(fontSize: 17),) : const SizedBox(),
              searchIsEmpty ? const SizedBox(width: 20,) : const SizedBox(),
              Expanded(
                child: TextField(
                  cursorColor: Colors.amber,
                  controller: searchController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: !searchIsEmpty ? true : false,
                    fillColor: const Color.fromARGB(234, 255, 255, 255),
                    hintText: 'Search',
                    hintStyle: const TextStyle(color: Colors.white54, fontSize: 14),
                    prefixIcon: !searchIsEmpty? const Icon(Icons.search, color: Colors.blue, size: 17,) : null
                  ),
                  onChanged: (value) {
                    setState(() {
                      if(value.isEmpty){
                        searchIsEmpty = true;
                      }
                      else {
                        searchIsEmpty = false;
                      }
                    });
                  },
                  
                  style: TextStyle(
                    color: !searchIsEmpty? Colors.blue : Colors.white
                  ),
        
                ),
              )
            ],
          ),
        ),
        toolbarHeight: 40,//40
        actions: [
          ElevatedButton(
            onPressed: (){
              setState(() {
                favoriteShowed = !favoriteShowed;
              });
            },
            style: const ButtonStyle(
              elevation: MaterialStatePropertyAll(0),
              overlayColor: MaterialStatePropertyAll<Color>(Color.fromARGB(10, 0, 0, 0))
            ),
            child: Row(
              children: [
                const Icon(Icons.favorite, size: 17,),
                Icon(favoriteShowed ? Icons.arrow_drop_down : Icons.arrow_drop_up, size: 17)
              ],
            ),
          ),
          IconButton(
            onPressed: (){
              backFromAddContactPage(context);
            }, 
            icon: const Icon(Icons.add), 
            color: Colors.white,
            iconSize: 17,
          ),
          const SizedBox(width: 10,)

        ],
      ),
      body: Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            favoriteShowed ? Container(
              padding: const EdgeInsets.only(left: 5),
              color: Color.fromARGB(255, 235, 247, 255),
              height: 115,
              width: double.infinity,
              child: Material(
                color: Colors.transparent,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    for(Contacts contact in Data.contactsData)
                      if(contact.favorite == true)
                        if(initialFavContact != contact.name[0].toUpperCase() || initialFavContact == null)
                          favoriteContactHeader(contact: contact, newInitial: true)
                        else
                          favoriteContactHeader(contact: contact),
                        //FavoriteContactWidget(contact: contact,)
                    
                  ],
                ),
              ),
            ) : const SizedBox(height: 0,),
            Expanded(
              child: ListView(
                children: [
                  for(Contacts tempContact in Data.contactsData)
                    listContactHeader(tempContact: tempContact, searchText: searchController.text)
                ],
              ),
            ),
          ],
        )
      )
    );
  }

  Widget listContactHeader({required Contacts tempContact, String searchText = ''}){

    if(searchText.isNotEmpty){
      if(tempContact.name.toUpperCase().contains(searchText.toUpperCase())){
        return listContactHeader(tempContact: tempContact);
      }
      else {
        return const SizedBox();
      }
    }

    if (tempContact.name[0].toUpperCase() != initialContact || initialContact == null){
      initialContact = tempContact.name[0].toUpperCase();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(
            color: Colors.cyan,
            height: 5,
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              initialContact!,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500
              ),
            )
          ),
          listContactItem(tempContact),
        ],
      );
    }
    else{
      return listContactItem(tempContact);
    }
  }

  Widget listContactItem(Contacts tempContact) {

    return InkWell(
      splashColor: Colors.yellow,
      onLongPress: () {
        setState(() {
          tempContact.showedUp = true;
          Future.delayed(const Duration(milliseconds: 2200), () {
            setState(() {
              tempContact.showedUp = false;
            });
          });
        });
      },
      onTap: () async {
        dynamic isFavorite = await Navigator.push(context, MaterialPageRoute(
          builder: ((context) => ContactDetailPage(contacts: tempContact,))
        ));

        if(isFavorite is bool){
          setState(() {
            tempContact.favorite = isFavorite;
          });
        }
      },
      child: Container(
        decoration: tempContact.showedUp && tempContact.profilePic.isNotEmpty ? BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/${tempContact.profilePic}', ),
            fit: BoxFit.cover,
            opacity: 0.5,

          )
        ) : null,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProfilePictureWidget(tempContact: tempContact, containerSize: 75,),
            const SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tempContact.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                  ),
                ),
                Text(
                  tempContact.number,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    color: Colors.grey
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: favoriteWidget(tempContact)
              )
            ),
          ],
        )
      )
    );
  }

  Future<void> backFromAddContactPage(BuildContext context) async {
    dynamic newContact = await Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const AddContactPage())
    );

    setState(() {
      if(newContact is Contacts){
        Data.contactsData.add(newContact);
        Data.contactsData.sort(((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase())) );
      }
    });
  }

  Widget favoriteWidget(Contacts tempContact) {

    void onPressed(){
      setState(() {
        tempContact.favorite = !tempContact.favorite;
      });
    }

    if (tempContact.favorite == false){
      return IconButton(onPressed: onPressed, icon: const Icon(Icons.favorite_border_outlined));
    }
    else {
      return IconButton(onPressed: onPressed, icon: const Icon(Icons.favorite), color: Colors.red,);
    }
  }

  Widget favoriteContactHeader({required Contacts contact, bool newInitial = false}){
    if(newInitial){
      initialFavContact = contact.name[0].toUpperCase();
      return ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          const VerticalDivider(
            color: Colors.black,
            width: 8,
          ),
          Column(
            children: [
              const SizedBox(height: 10,),
              Text(
                initialFavContact!,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          FavoriteContactWidget(contact: contact),
        ]
      );
    }
    else{
      return FavoriteContactWidget(contact: contact);
    }
  }
}
