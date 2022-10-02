import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/model/contacts.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    Key? key,
    required this.tempContact,
    required this.containerSize,
  }) : super(key: key);

  final Contacts tempContact;
  final double containerSize;

  @override
  Widget build(BuildContext context) {
    if(tempContact.profilePic.isNotEmpty){
      return Container(
        height: containerSize,
        width: containerSize,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/photoProfile/${tempContact.profilePic}'), 
            fit: BoxFit.cover
          ),
          shape: BoxShape.circle
        ),
      );
    }
    else{
      return Container(
        height: containerSize,
        width: containerSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: tempContact.photoColor,
        ),
        alignment: Alignment.center,
        child: Text(
          (tempContact.name.isNotEmpty)? tempContact.name[0] : '', 
          style: const TextStyle(fontSize: 34, color: Colors.white),
        ),
      );
    }
    
  }
}