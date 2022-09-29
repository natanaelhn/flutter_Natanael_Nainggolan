import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/data/contacts.dart';
import 'package:flutter_application_form_input_button/meme.dart';
import 'package:flutter_application_form_input_button/meme_web.dart';
import 'package:flutter_application_form_input_button/profile_picture_widget.dart';

// ignore: must_be_immutable
class ContactDetailPage extends StatefulWidget {
  final Contacts contacts;
  bool isFavorite = false;

  ContactDetailPage({super.key, required this.contacts}){
    isFavorite = contacts.favorite;
  }

  @override
  State<ContactDetailPage> createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
        title: Text(widget.contacts.name),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), 
          onPressed: () {
            Navigator.pop(context, widget.isFavorite);
          },
        ),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                widget.isFavorite = !widget.isFavorite;
              });
            }, 
            icon: widget.isFavorite ? const Icon(Icons.favorite, color: Colors.red,) : 
              const Icon(Icons.favorite_border_outlined),
          ),
          const SizedBox(width: 5,),
        ],
    );

    double width = MediaQuery.of(context).size.width - 34;
    double height = MediaQuery.of(context).size.height - appBar.preferredSize.height 
      - MediaQuery.of(context).viewPadding.top - 34;
    double minSize = (width<height) ? width : height;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, widget.isFavorite);
        return false;
      } ,
      child: Scaffold(
        appBar: appBar,
        body: Container(
          //color: Colors.amber.shade100,
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                ProfilePictureWidget(tempContact: widget.contacts, containerSize: minSize),
                const SizedBox(height: 10,),
                Text(
                  widget.contacts.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 34,
                  ),
                ),
                Text(
                  widget.contacts.number,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Colors.black54
                  ),
                ),
                const SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => (!kIsWeb) ? const Meme() : const MemeWeb()
                    ));
                  }, 
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.pink.shade100),
                    side: MaterialStatePropertyAll<BorderSide>(BorderSide(color: Colors.pink.shade300, width: 1))
                  ),
                  child: SizedBox(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Icon(Icons.male, color: Colors.red,),
                        Icon(Icons.favorite, color: Colors.red,),
                        Icon(Icons.female, color: Colors.red,),
                      ],
                    ),
                  )
                )
              ]
              
    
            ),
          )
        ),
      ),
    );
  }
}