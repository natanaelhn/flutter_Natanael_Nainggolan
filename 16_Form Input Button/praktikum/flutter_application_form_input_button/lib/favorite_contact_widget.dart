import 'package:flutter/material.dart';
import 'package:flutter_application_form_input_button/contact_detail_page.dart';
import 'package:flutter_application_form_input_button/contacts.dart';
import 'package:flutter_application_form_input_button/profile_picture_widget.dart';

class FavoriteContactWidget extends StatefulWidget {
  final Contacts contact;

  const FavoriteContactWidget({super.key, required this.contact});

  @override
  State<FavoriteContactWidget> createState() => _FavoriteContactWidgetState();
}

class _FavoriteContactWidgetState extends State<FavoriteContactWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.yellow,
      onLongPress: () {
        Navigator.push(context, MaterialPageRoute(
          builder: ((context) => ContactDetailPage(contacts: widget.contact,))
        ));
      },
      child: Container(
        height: 70,
        width: 70,
        margin: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfilePictureWidget(tempContact: widget.contact, containerSize: 70),
            Text(
              widget.contact.name, 
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}