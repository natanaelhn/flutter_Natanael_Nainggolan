import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/common_widgets/contact_bottom_sheet_widget.dart';
import 'package:flutter_application_form_input_button/model/contacts.dart';
import 'package:flutter_application_form_input_button/model/data.dart';
import 'package:flutter_application_form_input_button/model/posts.dart';
import 'package:flutter_application_form_input_button/common_widgets/favorite_widget.dart';
import 'package:flutter_application_form_input_button/common_widgets/profile_picture_widget.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class PostListItemWidget extends StatefulWidget {
  final Posts post;
  late final Contacts contact;
  late String dateString;
  late final State? state;
  late final IPostListItem? iPostListItem;

  PostListItemWidget({
    Key? key,
    required this.post,
    this.state,
    this.iPostListItem,

  }) : super(key: key){
      
    if(post.ownerId == Data.personalInfo.id){
      contact = Data.personalInfo;
    }

    else{
      for(Contacts i in Data.contactsData){

        if(i.id == post.ownerId){
          contact = i;
          break;
        }
      }
    }
    

    final DateFormat formatter = DateFormat('yyyy-MMM-dd');
    dateString = (post.dateTime != null) ? formatter.format(post.dateTime!) : '';

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
        border: Border.all(width:0.5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Material(
            color: widget.post.bgColor,
            child: InkWell(
              onTap: () async {
                final bool? varTemp = await showContactBottomSheetWidget(context: context, contact: widget.contact);
                print(varTemp);
                if (varTemp != null && varTemp == true){
                  setState(() {
                    (widget.iPostListItem != null) ? widget.iPostListItem?.refreshPostList() : null;
                  });
                }
              },
              child: SizedBox(
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
                    ) : IconButton(
                      icon: const Icon(Icons.delete_forever), 
                      onPressed: () async{
                        
                        //AlertDialog
                        final bool? tempBool = await showDialog(context: context, builder: (context) => AlertDialog(
                          title: const Text('Delete post'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context), 
                              child: const Text('Cancel')
                            ),
                            TextButton(
                              onPressed: () => Navigator.pop(context, true), 
                              child: const Text('Delete')
                            ),
                          ],
                          content: Image(image: Posts.getImageProvider(widget.post)),
                        ),);

                        if (tempBool != null && tempBool == true){
                          Data.personalInfo.listPost.remove(widget.post);

                          (widget.state != null) ? widget.state?.setState(() { }) : null;
                          
                          if(widget.iPostListItem != null){
                            widget.iPostListItem?.refreshPostList(post: widget.post);
                          }
                        }
                      }, 
                      color: widget.post.fgColor,),
                  ]
                ),
              ),
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
                image: Posts.getImageProvider(widget.post)
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
}

class IPostListItem{
  refreshPostList({Posts? post}){}
}