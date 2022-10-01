import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/common_widgets/contact_bottom_sheet_widget.dart';
import 'package:flutter_application_form_input_button/common_widgets/post_list_item_widget.dart';
import 'package:flutter_application_form_input_button/model/contacts.dart';
import 'package:flutter_application_form_input_button/meme.dart';
import 'package:flutter_application_form_input_button/model/data.dart';

// ignore: must_be_immutable
class ContactDetailPage extends StatefulWidget {
  final Contacts contacts;
  // bool isFavorite = false;

  ContactDetailPage({super.key, required this.contacts}){
    // isFavorite = contacts.favorite;
  }

  @override
  State<ContactDetailPage> createState() => _ContactDetailPageState();
}

class _ContactDetailPageState extends State<ContactDetailPage> {
  

  @override
  Widget build(BuildContext context) {

    widget.contacts.listPost.sort(
      (a, b) => b.dateTime!.compareTo(a.dateTime!) ,
    );

    AppBar appBar = AppBar(
      title: Text(widget.contacts.name),
      backgroundColor: Data.personalInfo.theme.color,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back), 
        onPressed: () {
          Navigator.pop(context, true);
        },
      ),
      actions: [
        IconButton(
          onPressed: (){
            setState(() {
              //widget.isFavorite = !widget.isFavorite;
              widget.contacts.favorite = !widget.contacts.favorite;
            });
          }, 
          icon: widget.contacts.favorite ? const Icon(Icons.favorite, color: Colors.red,) : 
            const Icon(Icons.favorite_border_outlined),
        ),
        const SizedBox(width: 5,),
      ],
    );

    // double width = MediaQuery.of(context).size.width - 34;
    // double height = MediaQuery.of(context).size.height - appBar.preferredSize.height 
    //   - MediaQuery.of(context).viewPadding.top - 34;
    // double minSize = (width<height) ? width : height;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      } ,
      child: Scaffold(
        appBar: appBar,
        body: Container(
          //color: Colors.amber.shade100,
          height: double.infinity,
          width: double.infinity,
          
          padding: const EdgeInsets.symmetric(horizontal:0),
          child: ContactBottomSheetWidget(
            contact: widget.contacts, 
            roundedCorner: false, 
            navigatorOnTap: const Meme(),
            backgroundImageHeight: 100,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true, 
              itemCount: widget.contacts.listPost.length,
              itemBuilder: (BuildContext context, int index) => 
                PostListItemWidget(post: widget.contacts.listPost[index], state: this, ),
              
            ),
          )
        ),
      ),
    );
  }
}