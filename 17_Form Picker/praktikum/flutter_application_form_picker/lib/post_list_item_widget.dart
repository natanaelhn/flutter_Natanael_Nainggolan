import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/data/contacts.dart';
import 'package:flutter_application_form_input_button/data/data.dart';
import 'package:flutter_application_form_input_button/data/posts.dart';
import 'package:flutter_application_form_input_button/favorite_widget.dart';
import 'package:flutter_application_form_input_button/profile_picture_widget.dart';
import 'package:intl/intl.dart';

class PostListItemWidget extends StatefulWidget {
  final Posts post;
  late final Contacts contact;
  late final String dateString;
  late final State? state;

  PostListItemWidget({
    Key? key,
    required this.post,
    this.state,

  }) : super(key: key){
      
    if(post.ownerName == Data.personalInfo.name){
      contact = Data.personalInfo;
    }

    for(Contacts i in Data.contactsData){

      if(i.name == post.ownerName){
        contact = i;
        break;
      }
    }
    

    final DateFormat formatter = DateFormat('yyyy-MMM-dd');
    dateString = formatter.format(post.dateTime!);

  }

  @override
  State<PostListItemWidget> createState() => _PostListItemWidgetState();
}

class _PostListItemWidgetState extends State<PostListItemWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.post.bgColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            //color: Colors.amber,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfilePictureWidget(tempContact: widget.contact, containerSize: 50),
                const SizedBox(width: 17,),
                Expanded(
                  child: Text(
                    widget.contact.name, 
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: widget.post.fgColor),
                  ),
                ),
                (widget.contact.name != Data.personalInfo.name)? FavoriteWidget(
                  tempContact: widget.contact, 
                  state: (widget.state != null)? widget.state : this,
                ) : const SizedBox(),
              ]
            ),
          ),
          const SizedBox(height: 10,),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 3),
                    blurRadius: 7,
                  )
                ]
              ),
              child: Image(
                image: getImageProvider()
              )
            ),
          ),
          const SizedBox(height: 10,),
          Text(widget.dateString, style: TextStyle(fontSize: 12, color: widget.post.fgColor),),
          const SizedBox(height: 10,),
          Text(widget.post.caption, textAlign: TextAlign.justify, style: TextStyle(color: widget.post.fgColor),),
          const Divider(),

        ],
      )
    );
  }

  ImageProvider<Object> getImageProvider(){
    if(widget.post.fileName != null){
      return AssetImage('assets/postsPic/${widget.post.fileName}');
    }
    else if(widget.post.file != null){
      return FileImage(widget.post.file!);
    }
    else{
      return const AssetImage('assets/postsPic/unsave.jpg');
    }
  }
}